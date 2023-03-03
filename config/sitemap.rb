# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://enkyori-enmusubi.com"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}"
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV['S3_BUCKET_NAME'],
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  aws_region: ENV['AWS_REGION'],
)

SitemapGenerator::Sitemap.create do
  add root_path, :changefreq => 'daily', :priority => 1.0
  # ログイン
  add login_path, :priority => 0.5
  # ユーザー登録
  add new_user_path, :priority => 0.6
end