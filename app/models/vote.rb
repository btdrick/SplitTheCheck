class Vote < ApplicationRecord
  validates :user_id, uniqueness: { scope: :restaurant_id }
  validates :splits_check, inclusion: [true, false]
  belongs_to :user
  belongs_to :restaurant
end
