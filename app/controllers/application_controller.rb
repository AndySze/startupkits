class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def get_idea
    #if current_user.id != params[:user_id]
    #  redirect_to user_url(current_user)
    #else
      @idea = current_user.ideas.find(params[:idea_id])
    #end
  end

end
