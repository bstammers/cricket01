require 'spec_helper'

describe Player do

  context "relationships" do
    it {should belong_to(:match)}
  end
  context "validations" do
    it {should validate_presence_of(:first_name)}    
    it {should validate_presence_of(:last_name)}    
    it {should validate_presence_of(:full_name)}    
    it {should validate_presence_of(:display_name)}    
    it {should validate_presence_of(:team)}    
  end

end
