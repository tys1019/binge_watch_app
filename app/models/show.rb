class Show < ActiveRecord::Base
  has_many :seasons, dependent: :destroy
  has_many :episodes, through: :seasons

end
