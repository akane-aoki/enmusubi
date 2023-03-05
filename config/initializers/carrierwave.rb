CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    # アクセスキー
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    # シークレットキー
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    # Tokyo
    region: ENV['AWS_REGION'],
  }

  # 公開・非公開の切り替え
  config.fog_public     = true
  # キャッシュの保存期間
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.days.to_i}" }

  # キャッシュをS3に保存
  # config.cache_storage = :fog

  # S3のバケットを指定
  config.fog_directory  = ENV['S3_BUCKET_NAME']
  config.asset_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}"
end

# 日本語ファイル名の設定
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/