class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.belongs_to      :user,        index: true, foreign_key: true
      t.integer         :value,       null: false
      t.belongs_to      :scorable,    polymorphic: true
      t.text            :description
      t.boolean         :deleted,     null: false, default: false
      t.datetime        :deleted_at
      t.timestamps
    end
  end
end
