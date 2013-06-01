module FundsHelper
  def get_watsi_funds
    response = HTTParty.get 'https://watsi.org/fund-treatments.json' 
    data = JSON.parse response.body
    data['profiles']
  end
end
