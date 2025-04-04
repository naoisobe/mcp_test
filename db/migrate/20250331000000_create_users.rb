class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.boolean :admin, default: false

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
