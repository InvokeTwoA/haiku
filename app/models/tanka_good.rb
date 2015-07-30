class TankaGood < ActiveRecord::Base
  scope :recent, -> { order("updated_at DESC") } 
  scope :popular, -> { order("value DESC") } 
end
