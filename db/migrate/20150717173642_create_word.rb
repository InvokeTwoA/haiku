class CreateWord < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.timestamps
    end
    create_table :users do |t|
      t.timestamps
    end

    add_column :words, :number, :integer 
    add_column :words, :text, :string
    add_column :words, :type, :string
    add_attachment :words, :avatar

    add_column :users, :name, :string
    add_column :users, :type, :string
    add_column :users, :admin_type, :string
    add_attachment :users, :avatar
  end
end
