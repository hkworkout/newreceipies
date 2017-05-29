class Recipe <ApplicationRecord
  belongs_to :chef, dependent: :destroy
  has_many :likes

  validates :name, presence: true, length: { minimum: 3, maximum: 40}
  validates :description, presence: true, length: { minimum: 3, maximum: 250}
  validates :summary, presence: true, length: { minimum: 3, maximum: 100}
  validates :chef_id, presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(updated_at: :DESC) }


  def thumbs_up_total
    self.likes.where(like: true).size

  end

  def thumbs_down_total
    self.likes.where(like: false).size
  end

  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end