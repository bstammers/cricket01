class Bowler < ActiveRecord::Base

  belongs_to :inning
  has_many :overs
  
  validates :name, presence: true

end
