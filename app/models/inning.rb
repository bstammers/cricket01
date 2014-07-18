class Inning < ActiveRecord::Base
  belongs_to :match
  has_many: :batsmans
  has_many: :bowlers
  has_many :innings
end
