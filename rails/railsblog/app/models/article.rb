class Article < ActiveRecord::Base
  validates :title, presence:true
  validates :body, presence:true
  self.per_page = 3
end
