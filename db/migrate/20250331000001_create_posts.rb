class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.boolean :published, default: false

      t.timestamps
    end
    add_index :posts, :title
  end
end
