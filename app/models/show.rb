class Show < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  has_many :episodes, through: :seasons

  def runtime
    (self.episodes.map(&:length).inject(:+) / 60.0).round(1)
  end
end
