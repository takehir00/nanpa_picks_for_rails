class User < ApplicationRecord
  has_secure_password
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :password, presence: true
end
