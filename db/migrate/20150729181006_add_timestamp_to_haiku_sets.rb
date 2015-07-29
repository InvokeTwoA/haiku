class AddTimestampToHaikuSets < ActiveRecord::Migration
  def change
    add_column(:haiku_sets, :created_at, :datetime)
    add_column(:haiku_sets, :updated_at, :datetime)
  end
end
