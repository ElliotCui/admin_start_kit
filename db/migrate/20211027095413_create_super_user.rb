class CreateSuperUser < ActiveRecord::Migration[6.1]
  def change
    create_table :super_users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :password_salt
      t.string :password_hash
      t.boolean :is_active, null: false, default: false

      t.timestamps

      t.index :email, unique: true
    end
  end
end
