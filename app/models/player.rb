class Player < ActiveRecord::Base

  belongs_to :match
  
  validates :first_name, :last_name, :full_name, :display_name, :team, presence: :true
  
  def self.list(team)
    where(team: team).order("players.id ASC")
  end
  def self.count(team)
    where(team: team).count
  end

end
