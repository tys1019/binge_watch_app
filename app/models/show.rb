
class Show < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  has_many :episodes
  has_many :vieweds
  has_and_belongs_to_many  :lists

  def runtime
    (self.episodes.map(&:length).inject(:+) / 60.0).round(0)
  end

  def time_watched
    if self.vieweds.where(viewed: true) == []
      0
    else
      (self.vieweds.where(viewed: true).map { |v| v.episode.length }.inject(:+) / 60.0).round(0)
    end
  end

  def time_left
    self.runtime - self.time_watched
  end
end
