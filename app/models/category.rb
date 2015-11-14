class Category < ActiveRecord::Base
  has_many :images
  validates_uniqueness_of :slug

  def to_param
    slug
  end

  def self.find_by_param(input)
    find_by_slug(input)
  end
end
