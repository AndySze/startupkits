class CustomerSegment < ActiveRecord::Base
  attr_accessible :description, :title, :idea_id

  belongs_to :idea
end
