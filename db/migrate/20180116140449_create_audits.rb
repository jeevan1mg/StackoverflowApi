class CreateAudits < ActiveRecord::Migration[5.1]
  def change
    create_table :audits do |t|
      t.references    :auditable,            polymorphic: true, index: true
      t.jsonb         :audited_object,       null: false,    default: '{}'
      t.jsonb         :audited_columns,      null: false,    default: '{}'
      t.integer       :auditor_id,           index: true
      t.boolean       :deleted,        null: false, default: false
      t.datetime      :deleted_at
      t.timestamps
    end
  end
end
