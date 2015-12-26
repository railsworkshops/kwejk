class Category < ActiveRecord::Base
  has_many :images
  validates_uniqueness_of :slug

  def to_param
    slug
  end
end
