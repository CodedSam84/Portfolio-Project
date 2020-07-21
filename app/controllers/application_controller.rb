class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SessionParameter
end
