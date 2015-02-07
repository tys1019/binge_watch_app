class StatusesController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @show = Show.find(params[:show_id])
    @episodes = @show.episodes

    if .save
      redirect_to
    else
      render
    end
  end

end


