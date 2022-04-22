# require 'carrierwave/processing/mime_types'
require 'mime/types'
require 'carrierwave/orm/activerecord'
class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
