require 'spec_helper'

describe OversController do

  before :each do
    @match = FactoryGirl.create(:match)
    @inning = FactoryGirl.create(:inning, match_id: @match.id)
    @over = FactoryGirl.create(:over, inning_id: @inning.id)
    @over_attributes = FactoryGirl.attributes_for(:over, inning_id: @inning)
  end

  describe "GET 'index'" do
    it "should get index" do
      get :index, inning_id: @inning.id
      should render_template(:index)
    end
  end

  describe "GET 'show'" do
    it "should get show" do
      get :show, id: @over.id
      should render_template(:show)
    end
  end

  describe "GET 'new'" do
    it "should get new" do
      get :new, inning_id: @inning.id
      should render_template(:new)
    end
  end

  describe "GET 'create'" do
    context "with valid attributes" do
      it "creates a new over successfully" do
        expect {
          post :create, inning_id: @inning, over: @over_attributes
        }.to change{Over.count}.by(1)
      end
      it "opens the new over" do
        post :create, inning_id: @inning, over: @over_attributes
        should redirect_to(Over.last)
      end
    end
    context "with invalid attributes" do
      before :each do
        @match = FactoryGirl.create(:match)
        @inning = FactoryGirl.create(:inning, match_id: @match.id)
        @over_name_attrib = FactoryGirl.attributes_for(:over, inning_id: @inning, bowler_name: nil, bowler_over: nil)
      end
      it "does not create a new over successfully without name" do
        expect {
          post :create, inning_id: @inning, over: @over_name_attrib
        }.to_not change{Over.count}
      end
      it "re-opens the new page" do
        post :create, inning_id: @inning, over: @over_name_attrib
        should render_template(:new)
      end
    end
  end

  describe "GET 'edit'" do
    it "should get edit" do
      get :edit, id: @over.id
      should render_template(:edit)
    end
  end

  describe "GET 'update'" do
    context "valid attribute updates" do
      it "should change the over attributes" do
        put :update, id: @over, over: FactoryGirl.attributes_for(:over, bowler_name: "J. Bloggs", bowler_over: "1-1", runs: 3, wides: 0, no_balls: 0, byes: 0, leg_byes: 0, wickets: 0, score: "0/3")
        @over.reload
        @over.bowler_name.should eq("J. Bloggs")
        @over.bowler_over.should eq("1-1")
        @over.runs.should eq(3)
        @over.wides.should eq(0)
        @over.no_balls.should eq(0)
        @over.byes.should eq(0)
        @over.leg_byes.should eq(0)
        @over.wickets.should eq(0)
        @over.score.should eq("0/3")
      end
      it "should redirect to the updated over" do
        put :update, id: @over, over: FactoryGirl.attributes_for(:over)
        should redirect_to(@over)
      end
    end
    context "invalid attribute updates" do
      it "should not change the over attributes" do
        put :update, id: @over, over: FactoryGirl.attributes_for(:over, bowler_name: nil, bowler_over: nil, runs: 3, wides: 0, no_balls: 0, byes: 0, leg_byes: 0, wickets: 0, score: "0/3")
        @over.reload
        @over.bowler_name.should eq("MyString")
        @over.bowler_over.should eq("MyString")
        @over.runs.should eq(1)
        @over.wides.should eq(1)
        @over.no_balls.should eq(1)
        @over.byes.should eq(1)
        @over.leg_byes.should eq(1)
        @over.wickets.should eq(1)
        @over.score.should eq("MyString")
      end
      it "should re-render the edit page" do
        put :update, id: @over, over: FactoryGirl.attributes_for(:over)
        should render_template(:edit, @over.id)
      end
    end
  end

  describe "GET 'delete'" do
    it "should delete the over" do
      expect {
          delete :destroy, id: @over
        }.to change{Over.count}.by(-1)
    end
    it "should redirect to the innings page" do
      delete :destroy, id: @over
      get :index, inning_id: @inning.id
      should render_template(:index)
    end
  end

end
