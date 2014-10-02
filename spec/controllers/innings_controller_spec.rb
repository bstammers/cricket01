require 'spec_helper'

describe InningsController do

  before :each do
    @match = FactoryGirl.create(:match)
    @inning = FactoryGirl.create(:inning, match_id: @match.id)
    @inning_attributes = FactoryGirl.attributes_for(:inning, match_id: @match)
  end

  describe "GET 'index'" do
    it "should get index" do
      get :index, match_id: @match.id
      should render_template(:index)
    end
  end

  describe "GET 'show'" do
    it "should get show" do
      get :show, match_id: @match.id, id: @inning.id
      should render_template(:show)
    end
  end

  describe "GET 'new'" do
    it "should get new" do
      get :new, match_id: @match.id
      should render_template(:new)
    end
  end

  describe "GET 'create'" do
    context "with valid attributes" do
      it "creates a new inning successfully" do
        expect {
          post :create, match_id: @match, inning: @inning_attributes
        }.to change{Inning.count}.by(1)
      end
      it "opens the new inning" do
        post :create, match_id: @match, inning: @inning_attributes
        should redirect_to(Inning.last)
      end
    end
    context "with invalid attributes" do
      before :each do
        @match = FactoryGirl.create(:match)
        @inning_bat_attrib = FactoryGirl.attributes_for(:inning, match_id: @match, batting_team: nil)
        @inning_bowl_attrib = FactoryGirl.attributes_for(:inning, match_id: @match, bowling_team: nil)
      end
      it "does not create a new inning successfully without batting team" do
        expect {
          post :create, match_id: @match, inning: @inning_bat_attrib
        }.to_not change{Inning.count}
      end
      it "does not create a new inning successfully without bowling team" do
        expect {
          post :create, match_id: @match, inning: @inning_bowl_attrib
        }.to_not change{Inning.count}
      end
      it "re-opens the new page" do
        post :create, match_id: @match, inning: @inning_bat_attrib
        should render_template(:new)
      end
    end
  end

  describe "GET 'edit'" do
    it "should get edit" do
      get :edit, match_id: @match.id, id: @inning.id
      should render_template(:edit)
    end
  end

  describe "GET 'update'" do
    context "valid attribute updates" do
      it "should change the inning attributes" do
        put :update, match_id: @match.id, id: @inning, inning: FactoryGirl.attributes_for(:inning, inning_no: 1, batting_team: "Third Away", bowling_team: "Third Home", score: "3/87")
        @inning.reload
        @inning.inning_no.should eq(1)
        @inning.batting_team.should eq("Third Away")
        @inning.bowling_team.should eq("Third Home")
        @inning.score.should eq("3/87")
      end
      it "should redirect to the updated inning" do
        put :update, match_id, @match.id, id: @inning, inning: FactoryGirl.attributes_for(:inning)
        should redirect_to(@inning)
      end
    end
    context "invalid attribute updates" do
      it "should not change the inning attributes" do
        put :update, match_id: @match.id, id: @inning, inning: FactoryGirl.attributes_for(:inning, inning_no: 1, batting_team: nil, bowling_team: nil, score: "3/87")
        @inning.reload
        @inning.inning_no.should eq(2)
        @inning.batting_team.should eq("MyString")
        @inning.bowling_team.should eq("MyString")
        @inning.score.should eq("MyString")
      end
      it "should re-render the edit page" do
        put :update, match_id: @match.id, id: @inning, inning: FactoryGirl.attributes_for(:inning)
        should render_template(:edit)
      end
    end
  end

  describe "GET 'delete'" do
    before :each do
      @match = FactoryGirl.create(:match)
      @inning = FactoryGirl.create(:inning, match_id: @match.id)
    end
    it "should delete the inning" do
      expect {
          delete :destroy, match_id: @match.id, id: @inning
        }.to change{Inning.count}.by(-1)
    end
    it "should redirect to the innings page" do
      delete :destroy, match_id: @match.id, id: @inning
      get :index, match_id: @match.id
      should render_template(:index)
    end
  end

end
