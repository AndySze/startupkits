class IdeaManagement < ActiveRecord::Base
  attr_accessible :idea_id, :user_id, :user_type

  after_create :set_user_type

  belongs_to :idea
  belongs_to :user

  private

  def set_user_type
    self.user_type = "creator" unless self.user_type
    self.save!
  end
end
