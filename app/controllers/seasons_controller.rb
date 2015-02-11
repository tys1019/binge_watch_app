require 'byebug'
class SeasonsController < ApplicationController

  def update
    @season = Season.find(params[:id])
    if @season.watched == true
      @season.watched = false

      @season.episodes.each do |episode|
        episode.watched = false
        episode.save
      end

      @season.save
      redirect_to(:back)
    else
      @season.watched = true
      @season.episodes.each do |episode|
        episode.watched = true
        episode.save
      end
      @season.save
      redirect_to(:back)
    end
  end

  # def toggle_watched
  #   @season = Season.find(params[:id])
  #   @user = @season.user
  #   @season.watched ? @season.unwatch : @season.watch
  # end
end
