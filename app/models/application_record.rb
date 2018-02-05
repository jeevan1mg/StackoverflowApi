class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Auditable
  include Commentable
  include Votable
  include Preservable
  include Scorable

end
