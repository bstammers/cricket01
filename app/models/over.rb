class Over < ActiveRecord::Base

  belongs_to :inning
  has_many :balls
  
  validates :bowler_name, :bowler_over, presence: true
  
end
