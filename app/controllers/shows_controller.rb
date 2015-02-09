require 'byebug'

class ShowsController < ApplicationController
  def welcome
    @shows = Show.all
  end

  def index
    @shows = Show.all
  end

# this update action is over simplified for demo purposes
# if there were separate users, it would add to the user's queue, as of now there is only one demo list
  def update
    @show = Show.find(params[:id])

    if @show.list

      @show.list = nil
      @show.save
      redirect_to "/shows"
    else
      @show.list = List.first
      @show.save
      redirect_to "/shows"
    end

  end

end
