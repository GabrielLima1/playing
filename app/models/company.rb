class Company < ApplicationRecord
  validates_presence_of :name, :description, message: 'Ops! Preencha esse Aqui!'
  belongs_to :user
  mount_uploader :logo, PhotoUploader

  # def send_image
  #   Cloudinary::Uploader.upload("public#{self.logo}")
  # end
end
