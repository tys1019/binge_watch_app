class Viewed < ActiveRecord::Base
  belongs_to :episode
  belongs_to :list

end
