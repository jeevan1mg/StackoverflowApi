class Tag < ApplicationRecord
  auditable
  hard_deletable
  soft_deletable

  has_and_belongs_to_many :questions

  validates :name, presence: true, length: 1..20, uniqueness: true
  validates :description, length: 1..500
end
