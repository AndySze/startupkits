class CustomerSegment < ActiveRecord::Base
  attr_accessible  :title, :idea_id

  belongs_to :idea
end
