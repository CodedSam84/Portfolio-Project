class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SessionParameter
  include CurrentUserConcern
  include DefaultPageContent
end
