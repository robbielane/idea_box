class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :ideas_images
  has_many :images, through: :ideas_images
  belongs_to :category
  validates :title, presence: true
  validates :body, presence: true
end
