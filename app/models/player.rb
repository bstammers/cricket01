class Player < ActiveRecord::Base

  belongs_to :match
  
  validates :first_name, :last_name, :full_name, :display_name, :team, presence: :true
  
end
