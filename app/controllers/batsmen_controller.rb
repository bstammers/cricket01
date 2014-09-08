class BatsmenController < ApplicationController
  
  before_action :set_inning
  before_action :set_batsman, only: [:show, :edit, :update, :destroy]

  def index
    @batsmen = @innings.batsmen
  end

  def show
  end

  private
    def set_batsman
      @batsman = Batsman.find_by_id(params[:id])
    end
    def set_inning
      if params[:inning_id]
        @inning = Inning.find_by_id(params[:inning_id])
      end
    end
#    def set_match
#      if params[:match_id]
#        @match = Match.find_by_id(params[:match_id])
#      end
#    end
    def inning_params
      params.require(:inning).permit(:name, :runs, :balls_faced, :fours, :sixes, :how_out, :ball_history, :inning_id)
    end
  
end
