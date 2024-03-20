FactoryBot.define do
  factory :post do
    title { 'サンプルタイトル' }
    description { 'サンプルの説明文です。' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/sample_image.jpg'), 'image/jpeg') }
  end
end
