class HomeController < ApplicationController
  def index
    if user_signed_in?
      render :index
    else
      redirect_to top_screen_index_path
    end
  end
end
