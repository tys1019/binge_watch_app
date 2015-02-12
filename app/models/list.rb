
class List < ActiveRecord::Base
  has_and_belongs_to_many  :shows
  has_many :vieweds

  # def time_left(show)
  #   @show = show
  #   @list = List.find(params[:id])
  #   episodes = @show.vieweds.where(list_id: @list.id)
  #   if episodes.where(viewed: true) == []
  #     0
  #   else
  #     (episodes.where(viewed: true).map(&:length).inject(:+) / 60.0).round(0)
  #   end
  # end

  def time_watched(show)

    if self.vieweds.where(viewed: true, show_id: show.id) == []
      0
    else
      (self.vieweds.where(viewed: true, show_id: show.id).map { |v| v.episode.length }.inject(:+) / 60.0).round(0)
    end
  end

  def time_left
    if self.vieweds == []
      0
    else
      (vieweds.where(viewed: false).map{|v| v.episode.length}.inject(:+) / 60.0 ).round(0)
    end
  end

  def has_show?(show)
    shows.include?(show)
  end

  def destroy_vieweds
    vieweds.destroy_all
  end
end
