require 'spec_helper'

describe FallOfWicketsController do

  before :each do
    @match = FactoryGirl.create(:match)
    @inning = FactoryGirl.create(:inning, match_id: @match.id)
    @fow = FactoryGirl.create(:fall_of_wicket, inning_id: @inning.id)
    @fow_attributes = FactoryGirl.attributes_for(:fall_of_wicket, inning_id: @inning)
  end

  describe "GET 'index'" do
    it "should get index" do
      get :index, inning_id: @inning.id
      should render_template(:index)
    end
  end

  describe "GET 'show'" do
    it "should get show" do
      get :show, id: @fow.id
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
      it "creates a new FOW successfully" do
        expect {
          post :create, inning_id: @inning, fall_of_wicket: @fow_attributes
        }.to change{FallOfWicket.count}.by(1)
      end
      it "opens the new FOW" do
        post :create, inning_id: @inning, fall_of_wicket: @fow_attributes
        should redirect_to(FallOfWicket.last)
      end
    end
    context "with invalid attributes" do
      before :each do
        @match = FactoryGirl.create(:match)
        @inning = FactoryGirl.create(:inning, match_id: @match.id)
        @fow_wicket_attrib = FactoryGirl.attributes_for(:fall_of_wicket, inning_id: @inning, wicket: nil)
      end
      it "does not create a new FOW successfully without name" do
        expect {
          post :create, inning_id: @inning, fall_of_wicket: @fow_wicket_attrib
        }.to_not change{FallOfWicket.count}
      end
      it "re-opens the new page" do
        post :create, inning_id: @inning, fall_of_wicket: @fow_wicket_attrib
        should render_template(:new)
      end
    end
  end

  describe "GET 'edit'" do
    it "should get edit" do
      get :edit, id: @fow.id
      should render_template(:edit)
    end
  end

  describe "GET 'update'" do
    context "valid attribute updates" do
      it "should change the FOW attributes" do
        put :update, id: @fow, fall_of_wicket: FactoryGirl.attributes_for(:fall_of_wicket, wicket: 2, batsman_out: "F. Smith", batsman_not_out: "J. Smith", partnership: 23)
        @fow.reload
        @fow.wicket.should eq(2)
        @fow.batsman_out.should eq("F. Smith")
        @fow.batsman_not_out.should eq("J. Smith")
        @fow.partnership.should eq(23)
      end
      it "should redirect to the updated FOW" do
        put :update, id: @fow, fall_of_wicket: FactoryGirl.attributes_for(:fall_of_wicket)
        should redirect_to(@fow)
      end
    end
    context "invalid attribute updates" do
      it "should not change the FOW attributes" do
        put :update, id: @fow, fall_of_wicket: FactoryGirl.attributes_for(:fall_of_wicket, wicket: nil, batsman_out: "F. Smith", batsman_not_out: "J. Smith", partnership: 23)
        @fow.reload
        @fow.wicket.should eq(1)
        @fow.batsman_out.should eq("MyString")
        @fow.batsman_not_out.should eq("MyString")
        @fow.partnership.should eq(1)
      end
      it "should re-render the edit page" do
        put :update, id: @fow, fall_of_wicket: FactoryGirl.attributes_for(:fall_of_wicket)
        should render_template(:edit, @fow.id)
      end
    end
  end

  describe "GET 'delete'" do
    it "should delete the over" do
      expect {
          delete :destroy, id: @fow
        }.to change{FallOfWicket.count}.by(-1)
    end
    it "should redirect to the innings page" do
      delete :destroy, id: @fow
      get :index, inning_id: @inning.id
      should render_template(:index)
    end
  end

end
