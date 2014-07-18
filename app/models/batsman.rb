class Batsman < ActiveRecord::Base
  belongs_to :inning
  has_many :balls
end
