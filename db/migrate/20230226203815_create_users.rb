class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.string :password_digest

      t.timestamps
    end

    add_index :users, :email, name: 'index_users_on_email', unique: true
  end
end