require 'byebug'
class EpisodesController < ApplicationController

  def update
    @episode = Episode.find(params[:id])
    if @episode.watched == false
      @episode.watched = true
      @episode.save
      redirect_to(:back)
    else
      @episode.watched = false
      @episode.save
      redirect_to(:back)
    end
  end

end
