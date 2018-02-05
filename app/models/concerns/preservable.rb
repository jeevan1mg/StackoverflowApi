module Preservable
  extend ActiveSupport::Concern
  included do
    def self.soft_deletable

      default_scope { where deleted: false }

      def destroy
        self.deleted = true
        self.deleted_at = Time.now
      end

    end

    def self.hard_deletable
      alias_method :hard_delete, :destroy
    end

  end
end