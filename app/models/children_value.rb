class ChildrenValue < ActiveRecord::Base
  belongs_to :child
  belongs_to :value
end
