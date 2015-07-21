class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :haiku_set_id, null: false
      t.integer :user_id
      t.text :name
      t.text :body
      t.timestamps null: false
    end
  end
end
