class List < ActiveRecord::Base
  has_and_belongs_to_many  :shows
  has_many :vieweds
end
