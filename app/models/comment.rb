class Comment < ActiveRecord::Base
  validates :name , length: { minimum: 2 } , presence: true
  validates :body , length: { minimum: 2 } , presence: true
  belongs_to :haiku_set
end
