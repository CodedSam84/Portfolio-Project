class BlogsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "blogs_#{params['blog_id']}_channel"
  end

  def speak(data)
    ActionCable.server.broadcast "blogs_#{params[:blog_id]}_channel", message: data["message"]
    current_user.comments.create!(content: data["message"], blog_id: data["blog_id"])
  end
end