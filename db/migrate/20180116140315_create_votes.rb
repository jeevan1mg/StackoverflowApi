class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.belongs_to    :user,           index: true, foreign_key: true
      t.references    :votable,        polymorphic: true, index: true
      t.integer       :vote_type,      null: false, limit: 1
      t.integer       :vote_value
      t.integer       :status,         null: false, limit: 1
      t.boolean       :deleted,        null: false, default: false
      t.datetime      :deleted_at
      t.timestamps
    end
  end
end
