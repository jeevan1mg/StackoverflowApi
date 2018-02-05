class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string        :name,          null: false,   limit: 20
      t.text          :description
      t.integer       :badge_type,    null: false
      t.integer       :status,        null: false,   default: 0
      t.boolean       :deleted,       null: false,   default: false
      t.datetime      :deleted_at
      t.timestamps
    end
  end
end
