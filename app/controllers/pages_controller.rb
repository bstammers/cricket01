class PagesController < ApplicationController
  def home
  end

  def scoresheet
    @match = Match.find_by_id(session[:match])
    @inning = Inning.find_by_id(session[:inning])
  end
end
