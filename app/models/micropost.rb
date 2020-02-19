class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 50 }
end