class BowlersController < ApplicationController
  
  before_action :set_inning
  before_action :set_bowler, only: [:show, :edit, :update, :destroy]

  def index
    session[:inning] = @inning.id
    @bowlers = @inning.bowlers
  end
  def show   
  end
  
  def new
    @bowler = @inning.bowlers.new
  end
  def create
    @bowler = @inning.bowlers.new(bowler_params)
    
    respond_to do |format|
      if @bowler.save
        format.html { redirect_to inning_bowlers_url, notice: 'Bowler was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bowler }
      else
        format.html { render action: 'new' }
        format.json { render json: @bowler.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @bowler.update(bowler_params)
        format.html { redirect_to bowler_url, notice: 'Bowler was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @bowler.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @id = @bowler.inning_id
    @bowler.destroy
    respond_to do |format|
      format.html { redirect_to inning_bowlers_path(@id), notice: 'Bowler deleted successfully.' }
      format.json { head :no_content }
    end
  end

  private
    def set_inning
      if params[:inning_id]
        @inning = Inning.find_by_id(params[:inning_id])
      end
    end
    def set_bowler
      @bowler = Bowler.find_by_id(params[:id])
    end
    def bowler_params
      params.require(:bowler).permit(:name, :overs_bowled, :runs, :wickets, :wides, :no_balls, :maidens, :inning_id)
    end
end
