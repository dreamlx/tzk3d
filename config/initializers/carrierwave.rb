CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIJ2FNAJJH2TW3FEQ',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'ap-southeast-1',                  # optional, defaults to 'us-east-1'
    #:host                   => 'tzk3d.herokuapp.com',             # optional, defaults to nil
    #:endpoint               => 'http://tzk3d.s3-website-ap-southeast-1.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'tzk3d'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end