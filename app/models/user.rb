class User < ApplicationRecord
  has_secure_password

  has_many :ideas
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
  enum role: %w(default admin)

end
