module ApplicationHelper
  # def page_title(page_title = '')
  #   base_title = '遠結び'

  #   page_title.empty? ? base_title : page_title + " | " + base_title
  # end

  def default_meta_tags
    {
      separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
      reverse: true,
      site: '遠結び',
      title: '遠距離恋愛の「寂しい」を「楽しい」に。',
      description: '遠距離恋愛中で、恋人と会えない寂しさを抱えている方に、会えない時間を充実させ、楽しみに変えてくれるサービスです。恋人と一緒に使って、会えない時間も楽しもう！',
      keywords: '遠結び,縁結び,遠距離,遠距離恋愛,恋人,カップル,寂しい,さみしい,会えない',
      canonical: request.original_url,  #優先するurlを指定する
      charset: 'utf-8',
      icon: [
        { href: image_url('favicon.ico') },
        # { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: '遠結び',
        title: '遠距離恋愛の「寂しい」を「楽しい」に。',
        description: '遠距離恋愛中で、恋人と会えない寂しさを抱えている方に、会えない時間を充実させ、楽しみに変えてくれるサービスです。恋人と一緒に使って、会えない時間も楽しもう！',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@ツイッターのアカウント名',
      }
    }
  end

  # def assign_meta_tags(options = {})
  #   defaults = t('meta_tags.defaults')
  #   options.reverse_merge!(defaults)

  #   site = options[:site]
  #   title = options[:title]
  #   description = options[:description]
  #   keywords = options[:keywords]
  #   # image = options[:image].presence || image_url('image.png')

  #   configs = {
  #     separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
  #     reverse: true,
  #     site: site,
  #     title: page_title.empty? ? title : page_title,
  #     description: description,
  #     keywords: keywords,   #キーワードを「,」区切りで設定する
  #     canonical: request.original_url,  #優先するurlを指定する
  #     # noindex: ! Rails.env.production?,
  #     icon: [                    #favicon、apple用アイコンを指定する
  #       { href: image_url('favicon.ico') },
  #       # { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
  #     ],
  #     og: {
  #       site_name: site,
  #       title: page_title.empty? ? title : page_title,
  #       description: description,
  #       type: 'website',
  #       url: request.original_url,
  #       image: image_url('ogp.png'),
  #       locale: 'ja_JP',
  #     },
  #     twitter: {
  #       card: 'summary_large_image',
  #       site: '@ツイッターのアカウント名',
  #     }
  #   }
  #   set_meta_tags(configs)
  # end
end