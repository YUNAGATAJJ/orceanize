# frozen_string_literal: true

# OGP設定用
module ApplicationHelper
  def default_meta_tags
    {
      site: 'Orceanize',
      title: '足元から始まる、海ごみ問題。',
      reverse: true,
      charset: 'utf-8',
      description: '自分だけの海ごみアートを、世界に向けて公開することができるプラットフォームです。',
      keywords: '海ごみ,海洋汚染,海ごみアート',
      # canonical: request.original_url,
      canonical: 'https://www.orceanize.com/',
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        # url: request.original_url,
        url: 'https://www.orceanize.com',
        image: image_url('ogp.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('ogp.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
