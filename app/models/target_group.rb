class TargetGroup < ActiveRecord::Base
  has_many :countries

  has_many :leaf_tgs, class_name: 'TargetGroup', foreign_key: 'parent_id'
  belongs_to :root_tg, class_name: 'TargetGroup'
end
