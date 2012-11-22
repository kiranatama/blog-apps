class Post < ActiveRecord::Base
  letsrate_rateable "quality"
  attr_accessible :title, :body

  validates_presence_of :title, :body

  belongs_to :user
end
