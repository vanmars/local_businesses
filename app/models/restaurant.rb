class Restaurant < ApplicationRecord
  # Validations
  validates :name, :kind, :description, :review, presence: true
end