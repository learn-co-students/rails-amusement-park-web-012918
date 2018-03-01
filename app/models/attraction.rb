class Attraction < ActiveRecord::Base
  # write associations here
  has_many :users, through: :rides
  has_many :rides
end
