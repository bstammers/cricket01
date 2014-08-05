class Match < ActiveRecord::Base
  
  has_many :players, as: :cricketer
  has_many :innings
  
end
