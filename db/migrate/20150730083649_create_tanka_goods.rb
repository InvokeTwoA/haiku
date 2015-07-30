class CreateTankaGoods < ActiveRecord::Migration
  def change
    create_table :tanka_goods do |t|
      t.integer :value
      t.timestamps
      t.integer :user_id
      t.integer :word1
      t.integer :word2
      t.integer :word3
      t.integer :word4
      t.integer :word5

      t.timestamps null: false
    end
  end
end
