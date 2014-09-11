require 'spec_helper'

describe Bowler do

  context "relationships" do
    it {should belong_to(:inning)}
    it {should have_many(:overs)}
  end
  context "validations" do
    it {should validate_presence_of(:name)}    
  end

end
