class Status < ActiveRecord::Base
  belongs_to :list
  belongs_to :episode
end
