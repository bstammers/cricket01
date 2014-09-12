class BallsController < ApplicationController

  before_action :set_over
  before_action :set_ball, only: [:show, :edit, :update, :destroy]

  def index
    session[:over] = @over.id
    @balls = @over.balls
  end
  def show   
  end

  def new
    @ball = @over.balls.new
  end
  def create
    @ball = @over.balls.new(ball_params)
    
    respond_to do |format|
      if @ball.save
        format.html { redirect_to over_balls_url, notice: 'Delivery was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ball }
      else
        format.html { render action: 'new' }
        format.json { render json: @ball.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @ball.update(ball_params)
        format.html { redirect_to over_balls_path(over_id: @ball.over_id), notice: 'Delivery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @ball.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @id = @ball.over_id
    @ball.destroy
    respond_to do |format|
      format.html { redirect_to over_balls_path(@id), notice: 'Delivery deleted successfully.' }
      format.json { head :no_content }
    end
  end

  private
    def set_over
      if params[:over_id]
        @over = Over.find_by_id(params[:over_id])
      end
    end
    def set_ball
      @ball = Ball.find_by_id(params[:id])
    end
    def ball_params
      params.require(:ball).permit(:over_ball, :runs, :how_out, :caught_by, :striker, :non_striker, :sundries, :sundries_type, :location, :over_id)
    end
end
