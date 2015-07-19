class Urls < ActiveRecord::Migration
  def change
    create_table :haiku_sets do |t|
      t.string :token
      t.integer :word1
      t.integer :word2
      t.integer :word3
      t.integer :pv
    end
  end
end
