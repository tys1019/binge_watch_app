class List < ActiveRecord::Base
  has_many :statuses
  has_many :shows

end
