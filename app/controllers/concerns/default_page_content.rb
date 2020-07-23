module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_default
  end

  def set_page_default
    @page_title = "Sam Portfolio|My Portfolio Website"
    @seo_keyword = "Samuel Atobatele Portfolio"
  end
end