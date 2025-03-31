class HomeController < ApplicationController
  def index
    @latest_posts = Post.published.recent
  end
  
  def about
    # About page logic
  end
  
  def contact
    # Contact page logic
  end
end
