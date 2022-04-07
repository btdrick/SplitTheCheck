class Restaurant < ApplicationRecord
  has_many :votes
  default_scope -> { order(created_at: :desc) }
  #Parameter validation
  validates :name, presence: true
  validates :location, presence: true, format: {
      with: /\A[a-zA-Z\s]+,\s[A-Z]{2}\z/,
      message: "must be of format City, ST"
    }

  def self.ransackable_attributes(auth_object = nil)
    ["name", "location"]
  end

end
