require 'spec_helper'

describe InningsController do

  before :each do
    @inning = FactoryGirl.create(:inning, match_id: 1)
  end

  describe "GET 'index'" do
    it "should get index" do
      get :index
      should render_template(:index)
    end
  end

  describe "GET 'show'" do
    it "should get show" do
      get :show, id: @inning.id
      should render_template(:show)
    end
  end

  describe "GET 'new'" do
    it "should get new" do
      get :new
      should render_template(:new)
    end
  end

  describe "GET 'create'" do
    context "with valid attributes" do
      it "creates a new inning successfully" do
        expect {
          post :create, inning: FactoryGirl.attributes_for(:inning)
        }.to change{Inning.count}.by(1)
      end
      it "opens the new inning" do
        post :create, inning: FactoryGirl.attributes_for(:inning)
        should redirect_to(Inning.last)
      end
    end
    context "with invalid attributes" do
      it "does not create a new inning successfully without batting team" do
        expect {
          post :create, match: FactoryGirl.attributes_for(:invalid_inning_bat)
        }.to_not change{Inning.count}
      end
      it "does not create a new innning successfully without away team" do
        expect {
          post :create, inning: FactoryGirl.attributes_for(:invalid_inning_bowl)
        }.to_not change{Inning.count}
      end
      it "re-opens the new page" do
        post :create, inning: FactoryGirl.attributes_for(:invalid_inning_bat)
        should render_template(:new)
      end
    end
  end

  describe "GET 'edit'" do
    it "should get edit" do
      get :edit, id: @inning.id
      should render_template(:edit)
    end
  end

  describe "GET 'update'" do
    context "valid attribute updates" do
      it "should change the inning attributes" do
        put :update, id: @inning, inning: FactoryGirl.attributes_for(:inning, inning_no: 1, batting_team: "Third Away", bowling_team: "Third Home", score: "3/87")
        @inning.reload
        @inning.inning_no.should eq(1)
        @inning.batting_team.should eq("Third Away")
        @inning.bowling_team.should eq("Third Home")
        @inning.score.should eq("3/87")
      end
      it "should redirect to the updated inning" do
        put :update, id: @inning, inning: FactoryGirl.attributes_for(:inning)
        should redirect_to(@inning)
      end
    end
    context "invalid attribute updates" do
      it "should not change the inning attributes" do
        put :update, id: @inning, inning: FactoryGirl.attributes_for(:inning, inning_no: 1, batting_team: nil, bowling_team: nil, score: "3/87")
        @inning.reload
        @inning.inning_no.should eq(2)
        @inning.batting_team.should eq("MyString")
        @inning.bowling_team.should eq("MyString")
        @inning.score.should eq("MyString")
      end
      it "should re-render the edit page" do
        put :update, id: @inning, inning: FactoryGirl.attributes_for(:inning)
        should render_template(:edit)
      end
    end
  end

  describe "GET 'delete'" do
    it "should delete the inning" do
      @inning = FactoryGirl.create(:inning, match_id: 1)
      expect {
          delete :destroy, id: @inning
        }.to change{Inning.count}.by(-1)
    end
    it "should redirect to the innings page" do
      @inning = FactoryGirl.create(:inning, match_id: 1)
      delete :destroy, id: @inning
      get :index
      should render_template(:index)
    end
  end

end
