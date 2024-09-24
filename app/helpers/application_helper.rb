# application helper uses sessions and the actual helper
# funtions.
# Sessions - Keeps track of logged in users so they don't have
# to continuously log in all the time.
# logged_in? returns true false based on if there is an active
# session[:user_id] and a current_user, helper will return to us
# the db model for the currently logged in user
#
module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end
end
