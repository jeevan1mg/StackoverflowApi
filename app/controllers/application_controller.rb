class ApplicationController < ActionController::Base
  include Authenticable
  include ErrorHandlers
  include Errors
end
