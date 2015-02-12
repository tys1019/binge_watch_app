require 'byebug'

class ShowsController < ApplicationController
  def welcome
    @shows = Show.all
  end

  def index
    @shows = Show.all
  end

# adds a show to a list and creates joins for each episode and list
  # def update
  #   @show = Show.find(params[:id])
  #   @list = List.find(params[:show][:list_id])

  #   if @show.lists.include?(@list)


  #     @list.vieweds.where(show_id: @show.id).destroy_all

  #     @show.lists.delete(@list)
  #     @show.save
  #     redirect_to(:back)
  #     flash[:success] = 'List successfully updated.'
  #   else
  #     @show.lists << @list
  #     @show.save
  #     @show.episodes.each do |episode|
  #       viewed = Viewed.create
  #       viewed.episode = episode
  #       viewed.list = @list
  #       viewed.show = @show
  #       viewed.save
  #     end
  #     redirect_to(:back)
  #     flash[:success] = 'List successfully updated.'
  #   end

  # end

  def remove_from_queue
    @show = Show.find(params[:id])
    @list = List.find(params[:list_id])
      @list.vieweds.where(show_id: @show.id).destroy_all

      @show.lists.delete(@list)
      @show.save
      redirect_to(:back)
      flash[:success] = 'List successfully updated'

  end

  def add_to_queue
    @show = Show.find(params[:id])
    @list = List.find(params[:list_id])

    @show.lists << @list
    @show.save
    @show.episodes.each do |episode|
      viewed = Viewed.create
      viewed.episode = episode
      viewed.list = @list
      viewed.show = @show
      viewed.save
    end
    redirect_to(:back)
    flash[:success] = 'List successfully updated.'

  end

end
