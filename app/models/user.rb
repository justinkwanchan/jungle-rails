class User < ActiveRecord::Base

  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  # Returns the authenticated user from the users table with matchin email and password
  # Email is case insensitive
  def self.authenticate_with_credentials(email, password)
    user = User.where("email LIKE ?", "%#{sanitize_sql_like(email)}%")
    user.any? ? user[0].authenticate(password) : nil
  end
end
