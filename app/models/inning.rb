class Inning < ActiveRecord::Base
  
  belongs_to :match
  has_many :batters
  has_many :bowlers
  has_many :fall_of_wickets
  has_many :overs
  
  validates :batting_team, :bowling_team, presence: true
end
