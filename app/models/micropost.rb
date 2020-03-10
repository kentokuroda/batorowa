class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 50 }
  
  def self.search(search)
    search ? where('platform LIKE ?', "%{search}%") : all
  end
end
