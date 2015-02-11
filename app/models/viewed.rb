class Viewed < ActiveRecord::Base
  belongs_to :episode
  belongs_to :list
  belongs_to :show

end
