class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :headline
      t.string :category
      t.text :content

      t.timestamps
    end
  end
end
