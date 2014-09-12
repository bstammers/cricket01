class FallOfWicket < ActiveRecord::Base
  
  belongs_to :inning
  
  validates :wicket, presence: true
  
end
