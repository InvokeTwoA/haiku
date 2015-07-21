class AddIndex < ActiveRecord::Migration
  def change
    add_index :haiku_sets, [:word1, :word2, :word3], :unique => true
  end
end
