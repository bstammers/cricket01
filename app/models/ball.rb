class Ball < ActiveRecord::Base
  
  belongs_to :delivery, polymorphic: true
  
end
