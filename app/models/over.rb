class Over < ActiveRecord::Base

  belongs_to :match_over, polymorphic: true
  has_many :balls, as: :delivery

end
