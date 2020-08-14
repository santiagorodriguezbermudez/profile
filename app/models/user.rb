class User < ApplicationRecord
  has_many :projects
  validates :user_name, presence: true
  has_secure_password
end
