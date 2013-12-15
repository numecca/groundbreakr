module WishboneAPI
  require 'rest_client'
  URL = 'https://www.wishbone.org/api/v1/'


  class << self
    def unfunded
      JSON.parse(RestClient.get URL + "campaigns/fundraising.json")["campaigns"]
    end

    def sort_by_funding(order="low_to_high")
      if order == 'low_to_high'
        unfunded.sort { |a,b| (percent_complete(a["left_to_raise"], a["total_fees"])) <=> (percent_complete(b["left_to_raise"], b["total_fees"])) }
      else
        unfunded.sort { |b,a| (percent_complete(a["left_to_raise"], a["total_fees"])) <=> (percent_complete(b["left_to_raise"], b["total_fees"])) }
      end
    end

    def funded
      JSON.parse(RestClient.get URL + "campaigns/funded.json")["campaigns"]
    end

    def find(id)
      JSON.parse(RestClient.get URL + "campaigns/#{id}.json")["campaigns"]
    end

    def import_to_database(json)
      Project.create! do |proj|
        proj.name = json["first_name"]
        proj.description = json["about_campaign"]
        proj.country = json["location"]
        proj.profile_url = json["url"]
        proj.avatar_url = json["student_avatar_url"]
        proj.target_amount = json["total_fees"]
        proj.raised_amount = json["total_fees"] - json["left_to_raise"]
      end
    end

    private

    def percent_complete(left, total)
      (left - total) / total
    end

  end

end
