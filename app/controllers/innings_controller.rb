class InningsController < ApplicationController


  before_action :set_match
  before_action :set_inning, only: [:show, :edit, :update, :destroy]


  def index
    session[:match] = @match.id
    @innings = @match.innings
  end

  def show
    session[:inning] = @inning.id
  end

  def new
    @inning = @match.innings.new  
  end
  def create
    @inning = @match.innings.new(inning_params)

    respond_to do |format|
      if @inning.save
        format.html { redirect_to match_innings_url, notice: 'Inning was successfully created.' }
        format.json { render action: 'show', status: :created, location: @inning }
      else
        format.html { render action: 'new' }
        format.json { render json: @inning.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @inning.update(inning_params)
        format.html { redirect_to match_innings_url, notice: 'Inning was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @inning.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inning.destroy
    respond_to do |format|
      format.html { redirect_to match_innings_path }
      format.json { head :no_content }
    end
  end

  private
    def set_inning
      @inning = Inning.find_by_id(params[:id])
    end
    def set_match
      if params[:match_id]
        @match = Match.find_by_id(params[:match_id])
      end
    end
    def inning_params
      params.require(:inning).permit(:inning_no, :batting_team, :bowling_team, :score, :match_id)
    end

end
