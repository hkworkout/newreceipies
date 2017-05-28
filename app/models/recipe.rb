class Recipe <ApplicationRecord
  belongs_to :chef, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 40}
  validates :description, presence: true, length: { minimum: 3, maximum: 250}
  validates :summary, presence: true, length: { minimum: 3, maximum: 100}
  validates :chef_id, presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size


  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end