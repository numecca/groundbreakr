namespace :funds do
  desc 'Populates funds with watsi api'
  task generate: :environment do
    puts 'Generating...'
    response = HTTParty.get 'https://watsi.org/fund-treatments.json' 
    data = JSON.parse response.body
    profiles = data['profiles']
    profiles.each do |profile|
      target_amount = profile['target'][1..-1].gsub(',','').to_f
      raised_amount = profile['donated'][1..-1].gsub(',','').to_f
      params = {
        name: profile['name'],
        country: profile['country'],
        description: profile['promo_description'],
        profile_url: profile['url'],
        avatar_url: profile['profile_url'],
        target_amount: target_amount,
        raised_amount: raised_amount
      }
      f = Fund.create params
      puts f
    end
  end
end
