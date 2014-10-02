class PlayersController < ApplicationController

  before_action :set_match
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    session[:match] = @match.id
    @players = @match.players
  end

  def show
  end

  def new
    @player = @match.players.new
  end

  def create
    @player = @match.players.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to match_players_url, notice: 'Player was successfully created.' }
        format.json { render action: 'show', status: :created, location: @player }
      else
        format.html { render action: 'new' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to player_url, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @id = @player.match_id
    @player.destroy
    respond_to do |format|
      format.html { redirect_to match_players_path(@id), notice: 'Player deleted successfully.' }
      format.json { head :no_content }
    end
  end

  private
    def set_player
      @player = Player.find_by_id(params[:id])
    end
    def set_match
      if params[:match_id]
        @match = Match.find_by_id(params[:match_id])
      end
    end
    def player_params
      params.require(:player).permit(:name, :runs, :balls_faced, :fours, :sixes, :how_out, :bowler, :ball_history, :inning_id)
    end

end
