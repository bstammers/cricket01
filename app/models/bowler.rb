class Bowler < ActiveRecord::Base
  
  belongs_to :inning
  has_many :overs, as: :match_over
  has_many :players, as: :cricketer
  
end
