module ApplicationHelper
  def page_title(page_title = '')
    base_title = '遠結び'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def show_meta_tags
    if display_meta_tags.blank?
      assign_meta_tags
    end
    display_meta_tags
  end

  def assign_meta_tags(options = {})
    defaults = t('meta_tags.defaults')
    options.reverse_merge!(defaults)

    site = options[:site]
    title = options[:title]
    description = options[:description]
    keywords = options[:keywords]
    # image = options[:image].presence || image_url('image.png')

    configs = {
      separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
      reverse: true,
      site: site,
      title: page_title.empty? ? title : page_title,
      description: description,
      keywords: keywords,   #キーワードを「,」区切りで設定する
      canonical: "https://enkyori-enmusubi.com",   #優先するurlを指定する
      # noindex: ! Rails.env.production?,
      icon: [                    #favicon、apple用アイコンを指定する
        { href: image_url('favicon.ico') },
        # { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: site,
        title: page_title.empty? ? title : page_title,
        description: description,
        type: 'website',
        url: "https://enkyori-enmusubi.com",
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@ツイッターのアカウント名',
      }
    }
    set_meta_tags(configs)
  end

#   def page_description
#     description = "遠距離恋愛中で、恋人と会えない寂しさを抱えている方に、 会えない時間を充実させ、楽しみに変えてくれるサービスです。恋人と一緒に使って、会えない時間も楽しもう！"

#     # if @work
#     #   description = "#{変数}と組み合わせたり"
#     # end

#     # description = @page_description.nil? ? description : @page_description
#     description
#   end

#   def page_image
#     image = asset_url('基本のサムネイル')

#     # # ページごとにサムネイルがあったら上書き
#     # if @works
#     #   @works.each do |work|
#     #     unless work&.thumbnail_url.blank? || work.nil?
#     #       image = work&.thumbnail_url
#     #       break
#     #     end
#     #   end
#     # end

#     image
#   end

#   def get_twitter_card_info(page)
#     twitter_card = {}

# # 　　# ページごとにTwitterシェア時のサムネイルを変える
# #     if page
# #       twitter_card[:url] = page.url
# #       twitter_card[:title] = page.title
# #       twitter_card[:description] = page.description
# #     else
# #       twitter_card[:url] = '基本のURL'
# #       twitter_card[:title] = '基本のタイトル'
# #       twitter_card[:description] = '基本の説明'
# #     end
#     twitter_card[:image] = asset_url('基本のサムネイル画像')
#     twitter_card[:card] = 'summary_large_image'
#     twitter_card[:site] = '@rubys8arks'
#     twitter_card
#   end
end
