require 'spec_helper'

describe Match do

  context "relationships" do
    it {should have_many(:innings)}
    it {should have_many(:match_overs)}
  end
  context "validations" do
    
  end
end
