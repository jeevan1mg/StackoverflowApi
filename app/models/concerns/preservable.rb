module Preservable
  extend ActiveSupport::Concern
  included do
    def self.preservable

      default_scope { where deleted: false }

      alias_method :hard_delete, :destroy

      def destroy
        self.deleted = true
        self.deleted_at = Time.now
      end
    end
  end
end