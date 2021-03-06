class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :platform, presence: true
  validates :introduce, length: { maximum: 255 }
  has_secure_password
  
  has_many :microposts
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :myrooms, through: :entries, source: :room
  #カラムの名前をmount_uploaderに指定
  mount_uploader :image, ImageUploader
end
