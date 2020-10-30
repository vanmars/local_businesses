class Shop < ApplicationRecord
  # Validations
  validates :name, :industry, :logo_url, :slogan, presence: true

  # Scopes
  scope :search, -> (shop_name, shop_industry) { where("name ilike ? AND industry ilike ?", "%#{shop_name}%", "%#{shop_industry}%") }

  # Callbacks
  before_save(:titleize, :capitalize)

private
  def titleize
    self.name = self.name.titleize
    self.industry = self.industry.titleize
  end

  def capitalize
    # self.slogan = self.slogan.capitalize
  end
end