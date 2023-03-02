# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://enkyori-enmusubi.com"

SitemapGenerator::Sitemap.create do
  add root_path, :changefreq => 'daily', :priority => 1.0
  # ログイン
  add login_path, :priority => 0.5
  # ユーザー登録
  add new_user_path, :priority => 0.6
end
