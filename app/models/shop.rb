class Shop < ApplicationRecord
  # Validations
  validates :name, :industry, :logo_url, :slogan, presence: true

  # Scopes
  scope :search, -> (shop_name, shop_industry) { where("name ilike ? AND industry ilike ?", "%#{shop_name}%", "%#{shop_industry}%") }
end