class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.string :title
      t.text :content
      t.boolean :is_restricted

      t.timestamps
    end
  end
end
