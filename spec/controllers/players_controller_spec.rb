require 'spec_helper'

describe PlayersController do

  before :each do
    @match = FactoryGirl.create(:match)
    @player = FactoryGirl.create(:player, match_id: @match.id)
    @player_attributes = FactoryGirl.attributes_for(:player, match_id: @match)
  end

  describe "GET 'index'" do
    it "should get index" do
      get :index, match_id: @match.id
      should render_template(:index)
    end
  end

  describe "GET 'show'" do
    it "should get show" do
      get :show, match_id: @match.id, id: @player.id
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
      it "creates a new player successfully" do
        expect {
          post :create, match_id: @match, player: @player_attributes
        }.to change{Player.count}.by(1)
      end
      it "opens the new player" do
        post :create, match_id: @match, player: @player_attributes
        should redirect_to(Player.last)
      end
    end
    context "with invalid attributes" do
      before :each do
        @match = FactoryGirl.create(:match)
        @player_first_attrib = FactoryGirl.attributes_for(:player, match_id: @match, first_name: nil)
        @player_last_attrib = FactoryGirl.attributes_for(:player, match_id: @match, last_name: nil)
        @player_full_attrib = FactoryGirl.attributes_for(:player, match_id: @match, full_name: nil)
        @player_display_attrib = FactoryGirl.attributes_for(:player, match_id: @match, display_name: nil)
        @player_team_attrib = FactoryGirl.attributes_for(:player, match_id: @match, team: nil)
      end
      it "does not create a new player successfully without first_name" do
        expect {
          post :create, match_id: @match, player: @player_first_attrib
        }.to_not change{Player.count}
      end
      it "re-opens the new page" do
        post :create, match_id: @match, player: @player_first_attrib
        should render_template(:new)
      end
      it "does not create a new player successfully without last_name" do
        expect {
          post :create, match_id: @match, player: @player_last_attrib
        }.to_not change{Player.count}
      end
      it "re-opens the new page" do
        post :create, match_id: @match, player: @player_last_attrib
        should render_template(:new)
      end
      it "does not create a new player successfully without full_name" do
        expect {
          post :create, match_id: @match, player: @player_full_attrib
        }.to_not change{Player.count}
      end
      it "re-opens the new page" do
        post :create, match_id: @match, player: @player_full_attrib
        should render_template(:new)
      end
      it "does not create a new player successfully without display_name" do
        expect {
          post :create, match_id: @match, player: @player_display_attrib
        }.to_not change{Player.count}
      end
      it "re-opens the new page" do
        post :create, match_id: @match, player: @player_display_attrib
        should render_template(:new)
      end
      it "does not create a new player successfully without team" do
        expect {
          post :create, match_id: @match, player: @player_team_attrib
        }.to_not change{Player.count}
      end
      it "re-opens the new page" do
        post :create, match_id: @match, player: @player_team_attrib
        should render_template(:new)
      end
    end
  end

  describe "GET 'edit'" do
    it "should get edit" do
      get :edit, id: @player.id
      should render_template(:edit)
    end
  end

  describe "GET 'update'" do
    context "valid attribute updates" do
      it "should change the player attributes" do
        put :update, id: @player, player: FactoryGirl.attributes_for(:player, first_name: "Joe", last_name: "Bloggs", full_name: "Joe Bloggs", display_name: "J. Bloggs", team: "First Home")
        @player.reload
        @player.first_name.should eq("Joe")
        @player.last_name.should eq("Bloggs")
        @player.full_name.should eq("Joe Bloggs")
        @player.display_name.should eq("J. Bloggs")
        @player.team.should eq("First Home")
      end
      it "should redirect to the updated player" do
        put :update, id: @player, player: FactoryGirl.attributes_for(:player)
        should redirect_to(@player)
      end
    end
    context "invalid attribute updates" do
      it "should not change the player attributes" do
        put :update, id: @player, player: FactoryGirl.attributes_for(:player, first_name: nil, last_name: nil, full_name: nil, display_name: nil, team: nil)
        @player.reload
        @player.first_name.should eq("MyString")
        @player.last_name.should eq("MyString")
        @player.full_name.should eq("MyString")
        @player.display_name.should eq("MyString")
        @player.team.should eq("MyString")
      end
      it "should re-render the edit page" do
        put :update, id: @player, player: FactoryGirl.attributes_for(:player)
        should render_template(:edit, @player.id)
      end
    end
  end

  describe "GET 'destroy'" do
    it "should delete the player" do
      expect {
          delete :destroy, id: @player
        }.to change{Player.count}.by(-1)
    end
    it "should redirect to the match page" do
      delete :destroy, id: @player
      get :index, match_id: @match.id
      should render_template(:index)
    end
  end

end
