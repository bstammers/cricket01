require 'spec_helper'

describe Ball do

  context "relationships" do
    it {should belong_to(:over)}
  end
  context "validations" do
    
  end
end
