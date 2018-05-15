# Assuming entire application is an API application
# JSONAPI::ResourceController also can be include per controller basis
class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController
  # for API, changed from :exception to :null_session
  protect_from_forgery with: :null_session
end
