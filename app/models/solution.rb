class Solution < ActiveRecord::Base
  attr_accessible :description, :feature, :idea_id
  belongs_to :idea
end
