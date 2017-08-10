class Proposal < ApplicationRecord
  belongs_to :desire
  belongs_to :user
  mount_uploader :img1, Img1Uploader
  mount_uploader :img2, Img2Uploader
  mount_uploader :img3, Img3Uploader
end
