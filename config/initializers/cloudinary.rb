cloudinary_credentials = Rails.application.credentials.dig(:cloudinary)

Cloudinary.config do |config|
  config.cloud_name = cloudinary_credentials[:cloud_name]
  config.api_key = cloudinary_credentials[:api_key]
  config.api_secret = cloudinary_credentials[:api_secret]
  config.secure = true
  config.cdn_subdomain = true
end
