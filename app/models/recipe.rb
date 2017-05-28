class Recipe <ApplicationRecord
  belongs_to :chef, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 40}
  validates :description, presence: true, length: { minimum: 3, maximum: 250}
  validates :summary, presence: true, length: { minimum: 3, maximum: 100}
  validates :chef_id, presence: true
end