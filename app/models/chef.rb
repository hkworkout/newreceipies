class Chef <ApplicationRecord
  has_many :recipes
  has_many :likes

  before_save { self.email = email.downcase }
  validates :chefname, presence: true, length: { minimum: 5, maximum: 40 }
  VALID_REG_EXPR = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
              uniqueness: { case_sensitive: false }, 
              format: { with: VALID_REG_EXPR }
end