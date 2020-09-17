class ImageUploader < CarrierWave::Uploader::Base

  # リサイズしたり画像形式を変更するのに必要
  include CarrierWave::RMagick

  def create_square
    manipulate! do |img|
      narrow = img.columns > img.rows ? img.rows : img.columns
      img.crop(Magick::CenterGravity, narrow, narrow).resize(size, size)
    end
  end

  process :create_square

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 画像の上限を700pxにする
  process :resize_to_limit => [700, 700]

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # サムネイルを生成する設定
  version :thumb do
    process :resize_to_limit => [300, 300]
  end

  # jpeg,pngしか受け付けない
  def extension_white_list
    %w(jpeg png)
  end
end
