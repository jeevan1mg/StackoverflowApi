class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.belongs_to      :user,             forgein_key: true,       index: true
      t.text            :title,            null: false
      t.text            :text,             null: false
      t.integer         :status,           null: false,         default: 0,         limit: 1
      t.boolean         :deleted,          null: false,         default: false
      t.datetime        :deleted_at
      t.integer         :accepted_answer_id
      t.datetime        :accepted_answer_at
      t.timestamps
    end
  end
end
