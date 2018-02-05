class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to   :user,               forgein_key: true, index: true, null: false
      t.references   :commentable,        polymorphic: true, index: true, null: false
      t.text         :text,               null: false
      t.boolean      :helpful,            null: false, default: false
      t.integer      :status,             null: false, default: 0
      t.boolean      :deleted,            null: false, default: false
      t.datetime     :deleted_at
      t.timestamps
    end
  end
end
