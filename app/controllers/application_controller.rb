class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= AuthenticatedConstraint.current_user(request)
  end
end
