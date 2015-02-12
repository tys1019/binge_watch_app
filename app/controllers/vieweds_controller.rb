require 'byebug'

# the name is Viewed because of problems with reserved words
# it is a join between episodes, shows and user lists that says whether or not an episode has been viewed by that user
class ViewedsController < ApplicationController

  def toggle_viewed
    @viewed = Viewed.find(params[:id])

    @viewed.viewed == true ? @viewed.viewed = false : @viewed.viewed = true
    @viewed.save
    redirect_to :back
  end


end
