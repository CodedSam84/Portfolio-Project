class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SessionParameter

  def current_user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name:"Guest User", first_name:"Guest", last_name:"User", email:"guest@yahoo.com")
  end
end
