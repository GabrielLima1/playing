class Desire < ApplicationRecord
  validates_presence_of :title, :description,:action, message: 'Ops! Preencha esse Aqui!'
  belongs_to :user
  belongs_to :company
  mount_uploader :img1, PhotoUploader
  mount_uploader :img2, PhotoUploader
  mount_uploader :img3, PhotoUploader
end
