class Inning < ActiveRecord::Base
  
  belongs_to :match
  has_many :batsmen
  has_many :bowlers
  has_many :fall_of_wickets
  
end
