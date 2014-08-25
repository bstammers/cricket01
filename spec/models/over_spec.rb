require 'spec_helper'

describe Over do

  context "relationships" do
    it {should belong_to(:bowler)}
    it {should have_many(:balls)}
  end
  context "validations" do
    
  end
end
