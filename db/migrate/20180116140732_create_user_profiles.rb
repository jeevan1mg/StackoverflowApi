class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.belongs_to      :user,            index: {unique: true}, forgein_key: true
      t.string          :full_name
      t.integer         :score,           null:false, default: 0
      t.integer         :views,           null:false, default: 0
      t.jsonb           :badges,          null:false, default: '{}'
      t.boolean         :deleted,        null: false, default: false
      t.datetime        :deleted_at
      t.timestamps
    end
  end
end
