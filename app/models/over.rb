class Over < ActiveRecord::Base
  
  belongs_to :bowler
  has_many :balls
  
end
