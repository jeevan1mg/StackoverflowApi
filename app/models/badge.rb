class Badge < ApplicationRecord
  auditable
  preservable

  has_and_belongs_to_many :users
end
