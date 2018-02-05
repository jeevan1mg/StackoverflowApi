class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string        :name,            index: true,        null: false,        limit: 20, unique: true
      t.text          :description
      t.integer       :status,          null: false,        default: false,       limit: 1
      t.boolean       :deleted,         null: false,        default: false
      t.datetime      :deleted_at
      t.timestamps
    end
  end
end
