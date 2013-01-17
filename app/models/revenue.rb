class Revenue < ActiveRecord::Base
  attr_accessible :idea_id, :title

  belongs_to :idea
end
