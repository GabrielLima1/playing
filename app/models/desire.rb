class Desire < ApplicationRecord
  validates_presence_of :title, :description,:action, message: 'Ops! Preencha esse Aqui!'
  belongs_to :user
  belongs_to :company
  mount_uploader :img1, LogoUploader
  mount_uploader :img2, Img2Uploader
  mount_uploader :img3, Img3Uploader
end
