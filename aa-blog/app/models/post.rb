class Post < ActiveRecord::Base
  STATUS = %w(Draft Published)
  attr_accessible :body, :title, :category_id, :status
  validates :title, :body, :presence => true
  validates :status, :inclusion => { :in => self::STATUS }
  belongs_to :category
end
