class Ball < ActiveRecord::Base
  belongs_to :bowler
  belongs_to :over
  belongs_to :batsman
end
