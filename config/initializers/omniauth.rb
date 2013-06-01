Rails.application.config.middleware.use OmniAuth::Builder do
  provider :runkeeper, 'e3e64f1d9c604c0c838109905c15ec44', 'b7001a41ae084fba8abef26eff5e4042'
end