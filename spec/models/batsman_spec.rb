require 'spec_helper'

describe Batsman do

  context "relationships" do
    it {should belong_to(:inning)}
  end
  context "validations" do
    
  end
end
