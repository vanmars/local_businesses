class Restaurant < ApplicationRecord
  # Validations
  validates :name, :kind, :description, :review, presence: true

  # Scopes
  scope :search, -> (restaurant_name, restaurant_kind) { where("name ilike ? AND kind ilike ?", "%#{restaurant_name}%", "%#{restaurant_kind}%") }

  # Callbacks
  before_save(:titleize, :capitalize)

private
  def titleize
    self.name = self.name.titleize
    self.kind = self.kind.titleize
  end

  def capitalize
    self.description = self.description.capitalize
    self.review = self.review.capitalize
  end
end