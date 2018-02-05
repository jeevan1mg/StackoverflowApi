module Auditable
  extend  ActiveSupport::Concern

  included do
    def self.auditable
      has_many   :audits, as: :auditable
    end
  end
end