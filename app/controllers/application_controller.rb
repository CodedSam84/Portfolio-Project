class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SessionParameter
  include CurrentUserConcern
end
