class Batter < ActiveRecord::Base

  belongs_to :inning

  validates :name, presence: true
  
end
