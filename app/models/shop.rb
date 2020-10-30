class Shop < ApplicationRecord
  # Validations
  validates :name, :industry, :logo_url, :slogan, presence: true
end