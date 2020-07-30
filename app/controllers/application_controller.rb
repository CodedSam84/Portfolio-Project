class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SessionParameter
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = AtobateleViewTool::Renderer.copyright "Samuel Atobatele", "All rights reserved"
  end
end
