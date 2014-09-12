require 'spec_helper'

describe BallsController do

  before :each do
    @match = FactoryGirl.create(:match)
    @inning = FactoryGirl.create(:inning, match_id: @match.id)
    @over = FactoryGirl.create(:over, inning_id: @inning.id)
    @ball = FactoryGirl.create(:ball, over_id: @over.id)
    @ball_attributes = FactoryGirl.attributes_for(:ball, over_id: @over)
  end

  describe "GET 'index'" do
    it "should get index" do
      get :index, over_id: @over.id
      should render_template(:index)
    end
  end

  describe "GET 'show'" do
    it "should get show" do
      get :show, id: @ball.id
      should render_template(:show)
    end
  end

  describe "GET 'new'" do
    it "should get new" do
      get :new, over_id: @over.id
      should render_template(:new)
    end
  end

  describe "GET 'create'" do
    context "with valid attributes" do
      it "creates a new delivery successfully" do
        expect {
          post :create, over_id: @over, ball: @ball_attributes
        }.to change{Ball.count}.by(1)
      end
      it "opens the new delivery" do
        post :create, over_id: @over, ball: @ball_attributes
        should redirect_to(Ball.last)
      end
    end
    context "with invalid attributes" do
      before :each do
        @match = FactoryGirl.create(:match)
        @inning = FactoryGirl.create(:inning, match_id: @match.id)
        @over = FactoryGirl.create(:over, inning_id: @inning.id)
        @ball_id_attrib = FactoryGirl.attributes_for(:ball, over_id: @over, over_ball: nil)
      end
      it "does not create a new over successfully without name" do
        expect {
          post :create, over_id: @over, ball: @ball_id_attrib
        }.to_not change{Ball.count}
      end
      it "re-opens the new page" do
        post :create, over_id: @over, ball: @ball_id_attrib
        should render_template(:new)
      end
    end
  end

  describe "GET 'edit'" do
    it "should get edit" do
      get :edit, id: @ball.id
      should render_template(:edit)
    end
  end

  describe "GET 'update'" do
    context "valid attribute updates" do
      it "should change the delivery attributes" do
        put :update, id: @ball, ball: FactoryGirl.attributes_for(:ball, over_ball: "1-2", runs: 3, how_out: "", caught_by: "", striker: "F. Smith", non_striker: "J. Smith", sundries: 0, sundries_type: "", location: "2")
        @ball.reload
        @ball.over_ball.should eq("1-2")
        @ball.runs.should eq(3)
        @ball.how_out.should eq("")
        @ball.caught_by.should eq("")
        @ball.striker.should eq("F. Smith")
        @ball.non_striker.should eq("J. Smith")
        @ball.sundries.should eq(0)
        @ball.sundries_type.should eq("")
        @ball.location.should eq("2")
      end
      it "should redirect to the updated over" do
        put :update, id: @ball, ball: FactoryGirl.attributes_for(:ball)
        should redirect_to(@ball)
      end
    end
    context "invalid attribute updates" do
      it "should not change the over attributes" do
        put :update, id: @ball, ball: FactoryGirl.attributes_for(:ball, over_ball: nil, runs: 3, how_out: "", caught_by: "", striker: "F. Smith", non_striker: "J. Smith", sundries: 0, sundries_type: "", location: "2")
        @ball.reload
        @ball.over_ball.should eq("MyString")
        @ball.runs.should eq(1)
        @ball.how_out.should eq("MyString")
        @ball.caught_by.should eq("MyString")
        @ball.striker.should eq("MyString")
        @ball.non_striker.should eq("MyString")
        @ball.sundries.should eq(1)
        @ball.sundries_type.should eq("MyString")
        @ball.location.should eq("MyString")
      end
      it "should re-render the edit page" do
        put :update, id: @ball, ball: FactoryGirl.attributes_for(:ball)
        should render_template(:edit, @ball.id)
      end
    end
  end

  describe "GET 'delete'" do
    it "should delete the delivery" do
      expect {
          delete :destroy, id: @ball
        }.to change{Ball.count}.by(-1)
    end
    it "should redirect to the innings page" do
      delete :destroy, id: @ball
      get :index, over_id: @over.id
      should render_template(:index)
    end
  end


end
