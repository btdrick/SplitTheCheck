class Restaurant < ApplicationRecord
  after_initialize :set_defaults
  default_scope -> { order(created_at: :desc) }
  #Parameter validation
  validates :name, presence: true
  validates :location, presence: true, format: {
      with: /\A[a-zA-Z\s]+,\s[A-Z]{2}\z/,
      message: "must be of format City, ST"
    }
  validates :will_split, :wont_split,
    numericality: { greater_than_or_equal_to: 0 }

  def set_defaults
    unless persisted?
      self.will_split ||= 0
      self.wont_split ||= 0
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name", "location"]
  end
end
