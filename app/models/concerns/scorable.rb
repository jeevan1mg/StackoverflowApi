module Scorable
  extend  ActiveSupport::Concern

  included do
    def self.scorable
      has_one   :score, as: :scorable
    end
  end
end