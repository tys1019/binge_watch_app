require 'byebug'
class List < ActiveRecord::Base
  has_and_belongs_to_many  :shows
  has_many :vieweds

  def time_left(show)
    @show = show
    @list = List.find(params[:id])
    episodes = @show.vieweds.where(list_id: @list.id)
    if episodes.where(viewed: true) == []
      0
    else
      (episodes.where(viewed: true).map(&:length).inject(:+) / 60.0).round(0)
    end
  end
end
