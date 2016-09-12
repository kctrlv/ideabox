class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :images, through: :image_assignments
  validates :title, :body, presence: true, uniqueness: true
end
