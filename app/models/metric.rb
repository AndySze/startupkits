class Metric < ActiveRecord::Base
  attr_accessible :description, :idea_id, :title
  belongs_to :idea
end
