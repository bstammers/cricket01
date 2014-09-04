require 'spec_helper'

describe Inning do

  context "relationships" do
    it {should belong_to(:match)}
    it {should have_many(:batsmen)}
    it {should have_many(:bowlers)}
    it {should have_many(:fall_of_wickets)}
  end
  context "validations" do
    it {should validate_presence_of(:batting_team)}
    it {should validate_presence_of(:bowling_team)}    
  end
end
