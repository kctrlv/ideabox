class IdeasController < ApplicationController
  before_action :require_login

  def new
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      redirect_to user_path(current_user)
    else
      flash.now[:error] = @idea.errors.full_messages.join(",")
      render :new
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :category_id)
  end

  def require_login
    redirect_to login_path unless logged_in?
  end
end
