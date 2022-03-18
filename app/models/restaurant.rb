class Restaurant < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
  validates :location, presence: true, format: {
      with: /\A[a-zA-Z\s]+,\s[A-Z]{2}\z/,
      message: "Location must be of format City, ST"
    }
end
