class Proposal < ApplicationRecord
  validates_presence_of :message, :img1, :img2, :img3,  message: 'Ops! Preencha esse Aqui!'
  belongs_to :desire
  belongs_to :user
  mount_uploader :img1, PhotoUploader
  mount_uploader :img2, PhotoUploader
  mount_uploader :img3, PhotoUploader
end
