require 'byebug'
class EpisodesController < ApplicationController

  def update
    @episode = Episode.find(params[:id])
    if @episode.watched == false
      @episode.watched = true
      @episode.save
      redirect_to "/shows"
    else
      @episode.watched = false
      @episode.save
      redirect_to "/shows"
    end
  end

end
