class Proposal < ApplicationRecord
  belongs_to :desire
  belongs_to :user
  mount_uploader :img1, PhotoUploader
  mount_uploader :img2, PhotoUploader
  mount_uploader :img3, PhotoUploader
  # before_save :add_user

  def add_user
    desire = self.desire_id
    user = desire.user
    self.user = user
    self.save
  end
end
