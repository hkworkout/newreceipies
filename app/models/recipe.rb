class Recipe <ApplicationRecord
  belongs_to :chef, dependent: :destroy
end