require 'spec_helper'

describe Match do

  context "relationships" do
    it {should have_many(:innings)}
    it {should have_many(:match_overs)}
  end
  context "validations" do
    it {should validate_presence_of(:home_team)}
    it {should validate_presence_of(:away_team)}
    it {should validate_presence_of(:start_date)}
    it {should validate_presence_of(:end_date)}
  end
end
