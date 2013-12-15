Rails.application.config.middleware.use OmniAuth::Builder do
  provider :runkeeper, ENV['RUNKEEPER_KEY'] || 'e3e64f1d9c604c0c838109905c15ec44', ENV['RUNKEEPER_SECRET'] || 'b7001a41ae084fba8abef26eff5e4042'
  provider :facebook, ENV['FACEBOOK_KEY'] || '239836142793884', ENV['FACEBOOK_SECRET'] || '0fb512adcefc8486e2ac65b268356c29'
end
