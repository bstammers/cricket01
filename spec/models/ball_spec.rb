require 'spec_helper'

describe Ball do

  context "relationships" do
    it {should belong_to(:over)}
  end
  context "validations" do
    it {should validate_presence_of(:over_ball)}    
  end
end
