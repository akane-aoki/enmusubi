module ApplicationHelper
  def page_title(page_title = '')
    base_title = '遠結び'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def page_description
    description = "遠距離恋愛中で、恋人と会えない寂しさを抱えている方に、 会えない時間を充実させ、楽しみに変えてくれるサービスです。恋人と一緒に使って、会えない時間も楽しもう！"

    # if @work
    #   description = "#{変数}と組み合わせたり"
    # end

    # description = @page_description.nil? ? description : @page_description
    description
  end

  def page_image
    image = asset_url('基本のサムネイル')

    # # ページごとにサムネイルがあったら上書き
    # if @works
    #   @works.each do |work|
    #     unless work&.thumbnail_url.blank? || work.nil?
    #       image = work&.thumbnail_url
    #       break
    #     end
    #   end
    # end

    image
  end

  def get_twitter_card_info(page)
    twitter_card = {}

# 　　# ページごとにTwitterシェア時のサムネイルを変える
#     if page
#       twitter_card[:url] = page.url
#       twitter_card[:title] = page.title
#       twitter_card[:description] = page.description
#     else
#       twitter_card[:url] = '基本のURL'
#       twitter_card[:title] = '基本のタイトル'
#       twitter_card[:description] = '基本の説明'
#     end
    twitter_card[:image] = asset_url('基本のサムネイル画像')
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:site] = '@rubys8arks'
    twitter_card
  end

end
