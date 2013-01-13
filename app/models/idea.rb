class Idea < ActiveRecord::Base
  attr_accessible :description, :title, :user_id

  belongs_to :user
  has_many :customer_segments, :dependent=> :destroy
  has_many :problems, :dependent=> :destroy
  has_many :advantages, :dependent=> :destroy
  has_many :uvps, :dependent=> :destroy
  has_many :channels, :dependent=> :destroy
  has_many :metrics, :dependent=> :destroy
  has_many :solutions, :dependent=> :destroy
end
