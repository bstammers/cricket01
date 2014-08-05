class Inning < ActiveRecord::Base
  
  belongs_to :match
  has_many :overs, as: :match_over
  has_many :fall_of_wickets
  has_many :batsmen
  has_many :bowlers
  
end
