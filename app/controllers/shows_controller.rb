require 'byebug'

class ShowsController < ApplicationController
  def welcome
    @shows = Show.all
  end

  def index
    @shows = Show.all
  end

# adds a show to a list and creates joins for each episode and list
  def update
    @show = Show.find(params[:id])
    @list = List.find(params[:show][:list_id])

    if @show.lists.include?(@list)

      @show.lists.delete(@list)
      @show.save
      redirect_to(:back)
      flash[:success] = 'List successfully updated.'
    else
      @show.lists << @list
      @show.save
      @show.episodes.each do |episode|
        viewed = Viewed.create
        viewed.episode = episode
        viewed.list = @list
        viewed.save
      end
      redirect_to(:back)
      flash[:success] = 'List successfully updated.'
    end

  end

end
