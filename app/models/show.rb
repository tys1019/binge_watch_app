require 'byebug'
class Show < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  has_many :episodes

  def runtime
    (self.episodes.map(&:length).inject(:+) / 60.0).round(0)
  end

  def time_watched
    if self.episodes.where(watched: true) == []
      0
    else
      (self.episodes.where(watched: true).map(&:length).inject(:+) / 60.0).round(0)
    end
  end

  def time_left
    self.runtime - self.time_watched
  end
end
