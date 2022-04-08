class Vote < ApplicationRecord
  validates :splits_check, inclusion: [true, false]
  belongs_to :user
  belongs_to :restaurant
end
