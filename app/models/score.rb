class Score < ApplicationRecord
  auditable
  preservable

  belongs_to :user
  belongs_to :scorable, polymorphic: true

  validates_presence_of :user, :value, :scorable
  validates_numericality_of :value
  validates_length_of :description, in: 1..500

end
