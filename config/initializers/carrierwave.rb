CarrierWave.configure do |config|
  config.fog_credentials = {
    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

    :provider              => 'AWS',
    :aws_access_key_id     => ENV['S3_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET'],
    :region                => ENV['S3_REGION']
  }

  # For testing, upload files to local `tmp` folder.
  if Rails.env.production?
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  else
    config.cache_dir = "tmp/uploads"
  end

  config.storage = :fog

  config.fog_directory    = ENV['S3_BUCKET_NAME']
  #config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
  #config.fog_host         = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"
end
