class BattersController < ApplicationController

  before_action :set_inning
  before_action :set_batter, only: [:show, :edit, :update, :destroy]

  def index
    session[:inning] = @inning.id
    @batters = @inning.batters
  end
  def show
  end
  
  def new
    @batter = @inning.batters.new
  end
  def create
    @batter = @inning.batters.new(batter_params)

    respond_to do |format|
      if @batter.save
        format.html { redirect_to inning_batters_url, notice: 'Batsman was successfully created.' }
        format.json { render action: 'show', status: :created, location: @batter }
      else
        format.html { render action: 'new' }
        format.json { render json: @batter.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @batter.update(batter_params)
        format.html { redirect_to batter_url, notice: 'Batsman was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @batter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @id = @batter.inning_id
    @batter.destroy
    respond_to do |format|
      format.html { redirect_to inning_batters_path(@id), notice: 'Batsman deleted successfully.' }
      format.json { head :no_content }
    end
  end
  
  private
    def set_batter
      @batter = Batter.find_by_id(params[:id])
    end
    def set_inning
      if params[:inning_id]
        @inning = Inning.find_by_id(params[:inning_id])
      end
    end
    def batter_params
      params.require(:batter).permit(:name, :runs, :balls_faced, :fours, :sixes, :how_out, :bowler, :ball_history, :inning_id)
    end

end
