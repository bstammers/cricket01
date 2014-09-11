require 'spec_helper'

describe BowlersController do

  before :each do
    @match = FactoryGirl.create(:match)
    @inning = FactoryGirl.create(:inning, match_id: @match.id)
    @bowler = FactoryGirl.create(:bowler, inning_id: @inning.id)
    @bowler_attributes = FactoryGirl.attributes_for(:bowler, inning_id: @inning)
  end

  describe "GET 'index'" do
    it "should get index" do
      get :index, inning_id: @inning.id
      should render_template(:index)
    end
  end

  describe "GET 'show'" do
    it "should get show" do
      get :show, id: @bowler.id
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
      it "creates a new bowler successfully" do
        expect {
          post :create, inning_id: @inning, bowler: @bowler_attributes
        }.to change{Bowler.count}.by(1)
      end
      it "opens the new bowler" do
        post :create, inning_id: @inning, bowler: @bowler_attributes
        should redirect_to(Bowler.last)
      end
    end
    context "with invalid attributes" do
      before :each do
        @match = FactoryGirl.create(:match)
        @inning = FactoryGirl.create(:inning, match_id: @match.id)
        @bowler_name_attrib = FactoryGirl.attributes_for(:bowler, inning_id: @inning, name: nil)
      end
      it "does not create a new bowler successfully without name" do
        expect {
          post :create, inning_id: @inning, bowler: @bowler_name_attrib
        }.to_not change{Bowler.count}
      end
      it "re-opens the new page" do
        post :create, inning_id: @inning, bowler: @bowler_name_attrib
        should render_template(:new)
      end
    end
  end

  describe "GET 'edit'" do
    it "should get edit" do
      get :edit, id: @bowler.id
      should render_template(:edit)
    end
  end

  describe "GET 'update'" do
    context "valid attribute updates" do
      it "should change the bowler attributes" do
        put :update, id: @bowler, bowler: FactoryGirl.attributes_for(:bowler, name: "J. Bloggs", overs_bowled: 1, runs: 3, wickets: 0, wides: 0, no_balls: 0, maidens: 0)
        @bowler.reload
        @bowler.name.should eq("J. Bloggs")
        @bowler.overs_bowled.should eq(1)
        @bowler.runs.should eq(3)
        @bowler.wickets.should eq(0)
        @bowler.wides.should eq(0)
        @bowler.no_balls.should eq(0)
        @bowler.maidens.should eq(0)
      end
      it "should redirect to the updated batsman" do
        put :update, id: @bowler, bowler: FactoryGirl.attributes_for(:bowler)
        should redirect_to(@bowler)
      end
    end
    context "invalid attribute updates" do
      it "should not change the batsman attributes" do
        put :update, id: @bowler, bowler: FactoryGirl.attributes_for(:bowler, name: nil, overs_bowled: 2, runs: 3, wickets: 0, wides: 0, no_balls: 0, maidens: 0)
        @bowler.reload
        @bowler.name.should eq("MyString")
        @bowler.overs_bowled.should eq(1)
        @bowler.runs.should eq(1)
        @bowler.wickets.should eq(1)
        @bowler.wides.should eq(1)
        @bowler.no_balls.should eq(1)
        @bowler.maidens.should eq(1)
      end
      it "should re-render the edit page" do
        put :update, id: @bowler, bowler: FactoryGirl.attributes_for(:bowler)
        should render_template(:edit, @bowler.id)
      end
    end
  end

  describe "GET 'delete'" do
    it "should delete the inning" do
      expect {
          delete :destroy, id: @bowler
        }.to change{Bowler.count}.by(-1)
    end
    it "should redirect to the innings page" do
      delete :destroy, id: @bowler
      get :index, inning_id: @inning.id
      should render_template(:index)
    end
  end

end
