class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :votes
  mount_uploader :picture, PictureUploader
end
