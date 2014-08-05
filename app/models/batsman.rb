class Batsman < ActiveRecord::Base
  
  belongs_to :inning
  has_many :balls, as: :delivery
  has_many :players, as: :cricketer
  
end
