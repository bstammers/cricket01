class Ball < ActiveRecord::Base
  belongs_to :bowler
  belongs_to :over
end
