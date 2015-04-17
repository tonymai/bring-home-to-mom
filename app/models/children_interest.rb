class ChildrenInterest < ActiveRecord::Base
  belongs_to :child
  belongs_to :interest
end
