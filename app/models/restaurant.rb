class Restaurant < ApplicationRecord
  # Validations
  validates :name, :kind, :description, :review, presence: true

  # Scopes
  scope :search, -> (restaurant_name, restaurant_kind) { where("name ilike ? AND kind ilike ?", "%#{restaurant_name}%", "%#{restaurant_kind}%") }

  # Callbacks
  before_save(:titleize, :capitalize)

private
  def titleize

  end

  def capitalize
    
  end
end