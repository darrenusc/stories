class ApplicationController < ActionController::Base
  # Comment out with: because interfering with 'Cancel' for actions create & update
  protect_from_forgery # with: :exception
end
