class Episode < ActiveRecord::Base
  belongs_to :season
  has_one :show, through: :season
  has_many :statuses

end
