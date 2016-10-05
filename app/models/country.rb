class Country < ActiveRecord::Base
  has_many :location_groups
  has_many :target_groups
end
