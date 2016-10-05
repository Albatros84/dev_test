class LocationGroup < ActiveRecord::Base
  has_and_belongs_to_many :locations
  has_one :country
end
