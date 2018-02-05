class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
      t.belongs_to     :user,        forgein_key: true, index: true, null: false
      t.datetime       :valid_till
      t.string         :auth_token
      t.datetime       :expired_at
      t.integer        :status,      null: false, default: 0, limit: 1
      t.timestamps
    end
  end
end