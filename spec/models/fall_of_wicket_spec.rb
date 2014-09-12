require 'spec_helper'

describe FallOfWicket do

  context "relationships" do
    it {should belong_to(:inning)}
  end
  context "validations" do
    it {should validate_presence_of(:wicket)} 
  end
  
end
