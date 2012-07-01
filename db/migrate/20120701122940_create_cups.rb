class CreateCups < ActiveRecord::Migration
  def change
    create_table :cups do |t|
      t.string :name

      t.timestamps
    end
  end
end
