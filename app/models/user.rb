class User < ApplicationRecord
  has_secure_password

  validates :user_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
