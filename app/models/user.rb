class User < ActiveRecord::Base
  validates :email, presence: true

  has_secure_password

  def is_admin?
    self.admin
  end
end
