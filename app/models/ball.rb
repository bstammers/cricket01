class Ball < ActiveRecord::Base
  
  belongs_to :over
  
  validates :over_ball, presence: true
  
end
