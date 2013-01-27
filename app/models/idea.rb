class Idea < ActiveRecord::Base
  attr_accessible :description, :title, :user_id
  before_save :generate_key

  belongs_to :user
  has_many :customer_segments, :dependent=> :destroy
  has_many :problems, :dependent=> :destroy
  has_many :advantages, :dependent=> :destroy
  has_many :uvps, :dependent=> :destroy
  has_many :channels, :dependent=> :destroy
  has_many :metrics, :dependent=> :destroy
  has_many :solutions, :dependent=> :destroy
  has_many :structure, :dependent=> :destroy
  has_many :revenue, :dependent=> :destroy

  has_many :idea_management, :dependent => :destroy
  has_many :users, :through => :idea_management

  def generate_key
    self.key = Digest::MD5.hexdigest(self.id.to_s + Time.now.to_s) unless self.key
  end

end
