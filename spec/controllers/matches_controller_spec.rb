require 'spec_helper'

describe MatchesController do
  
  before :each do
    @match = FactoryGirl.create(:match)
  end
  
  describe "'GET index'" do
    it "should get index" do
      get :index
      should render_template(:index)
    end
  end
  describe "'GET show'" do
    it "should get show" do
      get :show, id: @match.id
      should render_template(:show)
    end
  end
  describe "'GET new'" do
    it "should get new" do
      get :new
      should render_template(:new)
    end
  end

   describe "POST 'create'" do
    context "with valid attributes" do
      it "creates a new contact successfully" do
        expect {
          post :create, match: FactoryGirl.attributes_for(:match)
        }.to change{Match.count}.by(1)
      end
      it "opens the new contact" do
        post :create, match: FactoryGirl.attributes_for(:match)
        should redirect_to(Match.last)
      end
    end
    context "with invalid attributes" do
      it "does not create a new match successfully without home team" do
        expect {
          post :create, match: FactoryGirl.attributes_for(:invalid_match_home)
        }.to_not change{Match.count}
      end
      it "does not create a new match successfully without away team" do
        expect {
          post :create, match: FactoryGirl.attributes_for(:invalid_match_away)
        }.to_not change{Match.count}
      end
      it "re-opens the new page" do
        post :create, match: FactoryGirl.attributes_for(:invalid_match_home)
        should render_template(:new)
      end
    end
  end

  describe "GET 'edit'" do
    it "should get edit" do
      get :edit, id: @match.id
      should render_template(:edit)
    end
  end

  describe "PUT 'update'" do
#    before :each do
#      @match = FactoryGirl.create(:match)
#    end
    context "valid attribute updates" do
      it "should change the match attributes" do
        put :update, id: @match, match: FactoryGirl.attributes_for(:match, home_team: "Third Home", away_team: "Third Away", start_date: "01-01-2015", end_date: "05-01-2015")
        @match.reload
        @match.home_team.should eq("Third Home")
        @match.away_team.should eq("Third Away")
        @match.start_date.should eq(Date.parse("01-01-2015"))
        @match.end_date.should eq(Date.parse("05-01-2015"))
      end
      it "should redirect to the updated match" do
        put :update, id: @match, match: FactoryGirl.attributes_for(:match)
        should redirect_to(@match)
      end
    end
    context "invalid attribute updates" do
      it "should not change the match attributes" do
        put :update, id: @match, match: FactoryGirl.attributes_for(:match, home_team: nil, away_team: nil, ground: "Another Ground", start_date: nil, end_date: nil)
        @match.reload
        @match.home_team.should eq("MyString")
        @match.away_team.should eq("MyString")
        @match.ground.should_not eq("Another Ground")
        @match.start_date.should eq(Date.parse("25-08-2014"))
        @match.end_date.should eq(Date.parse("25-08-2014"))
      end
      it "should re-render the edit page" do
        put :update, id: @match, match: FactoryGirl.attributes_for(:match)
        should render_template(:edit)
      end
    end
  end

  describe "GET 'delete'" do
    it "should delete the match" do
      @match = FactoryGirl.create(:match)
      expect {
          delete :destroy, id: @match
        }.to change{Match.count}.by(-1)
    end
    it "should redirect to the matches page" do
      @match = FactoryGirl.create(:match)
      delete :destroy, id: @match
      get :index
      should render_template(:index)
    end
  end

end
