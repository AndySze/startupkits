class Solution < ActiveRecord::Base
  attr_accessible  :feature, :idea_id
  belongs_to :idea
end
