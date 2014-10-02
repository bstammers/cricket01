class Match < ActiveRecord::Base
  
  has_many :innings
  has_many :match_overs
  has_many :players
  
  validates :home_team, :away_team, :start_date, :end_date, presence: true
  
end
