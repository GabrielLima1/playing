class Proposal < ApplicationRecord
  belongs_to :desire
  belongs_to :user
  mount_uploader :img1, PhotoUploader
  mount_uploader :img2, PhotoUploader
  mount_uploader :img3, PhotoUploader
end
