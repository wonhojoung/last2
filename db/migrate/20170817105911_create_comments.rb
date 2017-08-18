class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.string :content
      #t.integer :post_id
      #정수라는 뜻
      t.timestamps null: false
    end
  end
end
