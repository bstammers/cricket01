require 'spec_helper'

describe Over do

  context "relationships" do
    it {should belong_to(:inning)}
    it {should have_many(:balls)}
  end
  context "validations" do
    it {should validate_presence_of(:bowler_name)} 
    it {should validate_presence_of(:bowler_over)} 
  end

end
