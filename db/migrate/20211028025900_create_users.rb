class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :gender, null: false
      t.string :email

      t.timestamps

      t.index :email, unique: true, where: 'email IS NOT NULL'
    end
  end
end
