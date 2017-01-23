class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  mount_uploader :picture, PictureUploader

  def votes_sum
    Vote.where(image_id: id).sum(:value)
  end
end
