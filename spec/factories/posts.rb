FactoryBot.define do
  factory :post do
    title { "サンプルタイトル" }
    description { "サンプルの説明文です。" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/sample_image.jpg'), 'image/jpeg') }
    # タグやユーザーなど、他の関連するモデルとの関連付けが必要な場合はここに追加する
    # 例: user { association :user }
  end
end
