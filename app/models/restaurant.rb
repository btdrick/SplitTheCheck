class Restaurant < ApplicationRecord
  has_many :votes, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  has_many :favorites, :dependent => :delete_all
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

  def get_will_split_vote_count
    self.votes.where(splits_check: true).count
  end

  def get_wont_split_vote_count
    self.votes.where(splits_check: false).count
  end

end
