require 'spec_helper'

describe BattersController do

  before :each do
    @match = FactoryGirl.create(:match)
    @inning = FactoryGirl.create(:inning, match_id: @match.id)
    @batter = FactoryGirl.create(:batter, inning_id: @inning.id)
    @batter_attributes = FactoryGirl.attributes_for(:batter, inning_id: @inning)
  end

  describe "GET 'index'" do
    it "should get index" do
      get :index, inning_id: @inning.id
      should render_template(:index)
    end
  end

  describe "GET 'show'" do
    it "should get show" do
      get :show, id: @batter.id
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
      it "creates a new batsman successfully" do
        expect {
          post :create, inning_id: @inning, batter: @batter_attributes
        }.to change{Batter.count}.by(1)
      end
      it "opens the new batsman" do
        post :create, inning_id: @inning, batter: @batter_attributes
        should redirect_to(Batter.last)
      end
    end
    context "with invalid attributes" do
      before :each do
        @match = FactoryGirl.create(:match)
        @inning = FactoryGirl.create(:inning, match_id: @match.id)
        @batter_name_attrib = FactoryGirl.attributes_for(:batter, inning_id: @inning, name: nil)
      end
      it "does not create a new batsman successfully without name" do
        expect {
          post :create, inning_id: @inning, batter: @batter_name_attrib
        }.to_not change{Batter.count}
      end
      it "re-opens the new page" do
        post :create, inning_id: @inning, batter: @batter_name_attrib
        should render_template(:new)
      end
    end
  end

  describe "GET 'edit'" do
    it "should get edit" do
      get :edit, id: @batter.id
      should render_template(:edit)
    end
  end

  describe "GET 'update'" do
    context "valid attribute updates" do
      it "should change the batsman attributes" do
        put :update, id: @batter, inning: FactoryGirl.attributes_for(:batter, name: "J. Bloggs", ball_history: "1 . . 2", balls_faced: 4, runs: 3, fours: 0, sixes: 0, how_out: "bowled", bowler: "B. Simpson")
        @batter.reload
        @batter.name.should eq("J. Bloggs")
        @batter.ball_history.should eq("1 . . 2")
        @batter.balls_faced.should eq(4)
        @batter.runs.should eq(3)
        @batter.fours.should eq(0)
        @batter.sixes.should eq(0)
        @batter.how_out.should eq("bowled")
        @batter.bowler.should eq("B. Simpson")
      end
      it "should redirect to the updated batsman" do
        put :update, id: @batter, batter: FactoryGirl.attributes_for(:batter)
        should redirect_to(@batter)
      end
    end
    context "invalid attribute updates" do
      it "should not change the batsman attributes" do
        put :update, id: @batter, batter: FactoryGirl.attributes_for(:batter, name: nil, ball_history: "1 . . 2", balls_faced: 4, runs: 3, fours: 0, sixes: 0, how_out: "bowled", bowler: "B. Simpson")
        @batter.reload
        @batter.name.should eq("MyString")
        @batter.ball_history.should eq("MyString")
        @batter.balls_faced.should eq(0)
        @batter.runs.should eq(0)
        @batter.fours.should eq(0)
        @batter.sixes.should eq(0)
        @batter.how_out.should eq("MyString")
        @batter.bowler.should eq("MyString")
      end
      it "should re-render the edit page" do
        put :update, id: @batter, batter: FactoryGirl.attributes_for(:batter)
        should render_template(:edit, @batter.id)
      end
    end
  end

  describe "GET 'delete'" do
    it "should delete the inning" do
      expect {
          delete :destroy, id: @batter
        }.to change{Batter.count}.by(-1)
    end
    it "should redirect to the innings page" do
      delete :destroy, id: @batter
      get :index, inning_id: @inning.id
      should render_template(:index)
    end
  end

end
