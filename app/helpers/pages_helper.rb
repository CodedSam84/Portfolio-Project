module PagesHelper  
  def news_url_parser(url)
    "<a href='#{url}', target='_blank'>#{url}</a>".html_safe
  end
end
