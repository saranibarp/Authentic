class User < ActiveRecord::Base
  validates :email, presence: true

  has_secure_password

  def is_admin?
    self.admin
  end

  def update_last_signed_in
    update_attribute(:last_signed_in_at, DateTime.now)
  end
end
