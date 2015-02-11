class Episode < ActiveRecord::Base
  belongs_to :season
  belongs_to :show
  has_many :vieweds


end
