class AddCommentsNumToHaikuSets < ActiveRecord::Migration
  def change
    add_column :haiku_sets, :comments_num, :integer, default: 0
  end
end
