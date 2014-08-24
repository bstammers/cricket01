class Match < ActiveRecord::Base
  
  has_many :innings
  has_many :match_overs
  
end
