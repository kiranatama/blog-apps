class Post < ActiveRecord::Base
  attr_accessible :body, :title, :category_id
  validates :title, :body, :presence => true
  belongs_to :category
end
