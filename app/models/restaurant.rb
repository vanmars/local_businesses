class Restaurant < ApplicationRecord
  # Validations
  validates :name, :type, :description, :review, presence: true
end