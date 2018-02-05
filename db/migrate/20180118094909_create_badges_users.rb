class CreateBadgesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :badges_users, id: false do |t|
      t.belongs_to     :badge,      index: true, foreign_key: true
      t.belongs_to     :user,       index: true, foreign_key: true
      t.timestamps
    end
  end
end
