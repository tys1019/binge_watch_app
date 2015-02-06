class ShowsController < ApplicationController
  def welcome
    @shows = Show.all
  end

  def index
    @shows = Show.all
  end

end
