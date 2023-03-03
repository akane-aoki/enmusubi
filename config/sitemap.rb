# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://enkyori-enmusubi.com"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['AWS_BUCKET_NAME']}"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  Rails.application.credentials[:aws][:bucket_name],
  aws_access_key_id: Rails.application.credentials[:aws][:access_key_id],
  aws_secret_access_key: Rails.application.credentials[:aws][:secret_access_key],
  aws_region: Rails.application.credentials[:aws][:region],
)

SitemapGenerator::Sitemap.create do
  add root_path, :changefreq => 'daily', :priority => 1.0
  # ログイン
  add login_path, :priority => 0.5
  # ユーザー登録
  add new_user_path, :priority => 0.6
end