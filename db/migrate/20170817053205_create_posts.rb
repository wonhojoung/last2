class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :mastername
      t.string :masternumber
      t.string :storename
      t.string :storenumber
      t.string :storeloc
      t.string :detailloc
      t.string :opentime
      t.string :closetime
      t.string :acceptpeople1
      t.string :acceptpeople2
      t.text :storeintro
      t.timestamps null: false
    end
  end
end
