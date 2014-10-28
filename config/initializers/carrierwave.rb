CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id     => ENV['S3_KEY'],
    :aws_secret_access_key => ENV['S3_SECRET'],
    #:region                => "us-east-1",
    #:host                   => ENV['S3_ASSET_URL'],             # optional, defaults to nil
    # :endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  #config.fog_directory  = ENV['S3_BUCKET_NAME']
  config.fog_directory  = "stackademy-f2014-us"                        # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
end

