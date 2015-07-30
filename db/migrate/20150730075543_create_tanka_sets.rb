class CreateTankaSets < ActiveRecord::Migration
  def change
    create_table :tanka_sets do |t|
      t.string :token
      t.integer :word1
      t.integer :word2
      t.integer :word3
      t.integer :word4
      t.integer :word5
      t.integer :pv
      t.integer :comments_num

      t.timestamps null: false
    end
  end
end
