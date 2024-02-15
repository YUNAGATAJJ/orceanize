# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

sea_creatures = ["ウニ", "カジキマグロ", "チョウチョウウオ", "タコ", "ペンギン", "イルカ", "ウミガメ", "マグロ", "シャチ", "クジラ", "クロマグロ", "アカウミガメ", "アオウミガメ", "オサガメ", "イソギンチャク", "シロナガスクジラ", "マッコウクジラ", "スナメリ", "ベルーガ", "バンドウイルカ", "コウテイペンギン", "アシカ", "メンダコ", "ケンサキイカ", "クラゲ", "サンゴ", "ヒトデ", "シュモクザメ", "ハリセンボン", "マンボウ", "エイ", "トビウオ", "カツオ", "フグ", "アンコウ", "セイウチ", "オットセイ", "ラッコ", "カニ", "エビ", "ロブスター", "ホタテ",  "サバ", "アジ", "ヒラメ", "トラフグ", "オニダルマオコゼ", "クマノミ", "イッカク", "ホッキョクグマ", "ミノカサゴ", "カワウソ", "ナンヨウハギ", "アザラシ", "チンアナゴ", "クリオネ", "チョウチンアンコウ", "クエ", "ジンベエザメ", "ヒョウモンダコ", "リュウグウノツカイ", "コブダイ", "ホホジロザメ", "ザトウクジラ", "ハナヒゲウツボ", "マンタ", "カワハギ", "ツノダシ", "ヘラヤガラ", "タツノオトシゴ", "オオカミウオ", "ヤドカリ", "ダイオウイカ", "ニシクロカジキ", "タカアシガニ", "リーフィーシードラゴン", "モンハナシャコ", "ダイオウグソクムシ", "タカアシガニ", "ネコザメ"]
sea_creatures.each do |creature|
  Sealiving.create(name: creature)
end
