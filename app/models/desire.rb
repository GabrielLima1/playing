class Desire < ApplicationRecord
  has_many :proposals
  belongs_to :user
  belongs_to :company
  validates_presence_of :title, :description,:action,:company,  message: 'Ops! Preencha esse Aqui!'
  mount_uploader :img1, PhotoUploader
  mount_uploader :img2, PhotoUploader
  mount_uploader :img3, PhotoUploader
end
