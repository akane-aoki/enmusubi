module ApplicationHelper
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
        separator: '|',
        site_name: '遠結び',
        title: :full_title, # :full_title とすると、サイトに表示される <title> と全く同じものを表示できる
        description: '遠距離恋愛中で、恋人と会えない寂しさを抱えている方に、会えない時間を充実させ、楽しみに変えてくれるサービスです。恋人と一緒に使って、会えない時間も楽しもう！',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@ツイッターのアカウント名',
        image: image_url('ogp.png')
      }
    }
  end
end