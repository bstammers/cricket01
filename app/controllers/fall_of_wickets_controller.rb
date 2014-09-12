class FallOfWicketsController < ApplicationController

  before_action :set_inning
  before_action :set_fow, only: [:show, :edit, :update, :destroy]

  def index
    session[:inning] = @inning.id
    @fows = @inning.fall_of_wickets
  end
  def show   
  end

  def new
    @fow = @inning.fall_of_wickets.new
  end
  def create
    @fow = @inning.fall_of_wickets.new(fow_params)
    
    respond_to do |format|
      if @fow.save
        format.html { redirect_to inning_fall_of_wickets_url, notice: 'FOW was successfully created.' }
        format.json { render action: 'show', status: :created, location: @over }
      else
        format.html { render action: 'new' }
        format.json { render json: @fow.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @fow.update(fow_params)
        format.html { redirect_to fall_of_wicket_url, notice: 'FOW was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @fow.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @id = @fow.inning_id
    @fow.destroy
    respond_to do |format|
      format.html { redirect_to inning_fall_of_wickets_path(@id), notice: 'FOW deleted successfully.' }
      format.json { head :no_content }
    end
  end


  private
    def set_inning
      if params[:inning_id]
        @inning = Inning.find_by_id(params[:inning_id])
      end
    end
    def set_fow
      @fow = FallOfWicket.find_by_id(params[:id])
    end
    def fow_params
      params.require(:fall_of_wicket).permit(:wicket, :batsman_out, :batsman_not_out, :partnership)
    end
end
