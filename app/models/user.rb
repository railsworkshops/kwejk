class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_many :images

  def set_default_role
    self.role ||= :user
  end

  def can_vote_for_image?(image)
    Vote.where(user: self, image: image).empty?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
