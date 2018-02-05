class Audit < ApplicationRecord
  hard_deletable
  soft_deletable

  belongs_to :auditable, polymorphic: true
  belongs_to :auditor, class_name: 'User'

  validates_presence_of  :auditor, :auditable, :audited_columns, :audited_object, :audited_columns
end