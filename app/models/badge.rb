class Badge < ApplicationRecord
  auditable
  hard_deletable
  soft_deletable

  has_and_belongs_to_many :users
end
