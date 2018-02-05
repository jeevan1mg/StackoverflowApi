class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string    :user_name,            null: false, index: {unique: true}, limit:25
      t.string    :email,                null: false, index: {unique: true}
      t.string    :encrypted_password,   null: false
      t.string    :salt,                 null: false
      t.integer   :status,               null: false, default: 0, limit: 1
      t.boolean   :deleted,              null: false, default: false
      t.datetime  :deleted_at
      t.timestamps
    end
  end
end
