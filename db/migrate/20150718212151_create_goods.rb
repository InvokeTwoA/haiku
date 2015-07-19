class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.integer :value
      t.timestamps
      t.integer :user_id
      t.integer :word1
      t.integer :word2
      t.integer :word3
    end
  end
end
