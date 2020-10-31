module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Login", new_user_session_path, class: style) +
      " ".html_safe +
      (link_to "Register", new_user_registration_path, class: style )
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style   
    end
  end

  def source_helper(styles)
    if session[:source]
      greeting = "Thank you for visiting me from #{session[:source]}, please feel free to #{link_to 'contact me', contact_path} if you'd like to work together"
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end

  def link_items
    [
      {
        path: root_path, page: "Home"
      },
      {
        path: about_me_path, page: "About Me"
      },
      {
        path: contact_path, page: "Contact"
      },
      {
        path: blogs_path, page: "Blog"
      },
      {
        path: portfolios_path, page: "Portfolio"
      },
      {
        path: tech_news_path, page: "Tech-News"
      }
    ]
  end

  def nav_helper tag, style
    link_nav = ""
    link_items.each do |item|
      link_nav << "<#{tag}><a href= '#{item[:path]}' class= '#{style} #{nav_active? item[:path]}'>#{item[:page]}</a></#{tag}>"
    end

    link_nav.html_safe
  end

  def nav_active? path
    "active" if current_page? path
  end
end