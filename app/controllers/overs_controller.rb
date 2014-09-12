class OversController < ApplicationController

  before_action :set_inning
  before_action :set_over, only: [:show, :edit, :update, :destroy]

  def index
    session[:inning] = @inning.id
    @overs = @inning.overs
  end
  def show   
  end

  def new
    @over = @inning.overs.new
  end
  def create
    @over = @inning.overs.new(over_params)
    
    respond_to do |format|
      if @over.save
        format.html { redirect_to inning_overs_url, notice: 'Over was successfully created.' }
        format.json { render action: 'show', status: :created, location: @over }
      else
        format.html { render action: 'new' }
        format.json { render json: @over.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @over.update(over_params)
        format.html { redirect_to over_url, notice: 'Over was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @over.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @id = @over.inning_id
    @over.destroy
    respond_to do |format|
      format.html { redirect_to inning_overs_path(@id), notice: 'Over deleted successfully.' }
      format.json { head :no_content }
    end
  end


  private
    def set_inning
      if params[:inning_id]
        @inning = Inning.find_by_id(params[:inning_id])
      end
    end
    def set_over
      @over = Over.find_by_id(params[:id])
    end
    def over_params
      params.require(:over).permit(:bowler_name, :bowler_over, :runs, :wides, :no_balls, :byes, :leg_byes, :wickets, :score, :inning_id)
    end
end
