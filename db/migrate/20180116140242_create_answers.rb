class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.belongs_to      :user,             forgein_key: true, index: true
      t.belongs_to      :question,         forgein_key: true, index: true
      t.text            :text,             null: false
      t.integer         :status,           null: false, default: 0
      t.boolean         :deleted,          null: false, default: false
      t.datetime        :deleted_at
      t.boolean         :accepted,         null: false, default: false
      t.boolean         :helpful,          null: false, default: false
      t.datetime        :accepted_at
      t.timestamps
    end
  end
end
