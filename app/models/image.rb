class Image < ApplicationRecord
  has_many :ideas, through: :image_assignments
  validates :url, presence: true, uniqueness: true
end
