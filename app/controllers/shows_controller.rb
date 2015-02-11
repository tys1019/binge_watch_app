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
    @list = List.find(params[:show][:list_id])

    if @show.lists.include?(:list_id)

      @show.lists.delete(@list)
      @show.save
      redirect_to(:back)
    else
      @show.lists << @list
      @show.save
      redirect_to(:back)
    end

  end

end
