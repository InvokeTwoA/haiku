class Good < ActiveRecord::Base
  scope :recent, -> { order("id DESC") } 

end
