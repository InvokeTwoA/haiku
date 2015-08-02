class AddVisibleFlagToWords < ActiveRecord::Migration
  def change
    add_column :words, :permit_flag, :boolean, default: false

    Word.all.each do |word|
      word.permit_flag = true
      word.save!
    end
  end
end
