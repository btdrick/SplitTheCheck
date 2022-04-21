class User < ApplicationRecord
  has_many :votes, :dependent => :delete_all
  has_many :favorites, :dependent => :delete_all
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
