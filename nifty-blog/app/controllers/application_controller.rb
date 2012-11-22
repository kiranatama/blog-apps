class ApplicationController < ActionController::Base
  include Pundit
  before_filter :authenticate_user!
  protect_from_forgery
end
