class Player < ActiveRecord::Base
  belongs_to :cricketer, polymorphic: true
end
