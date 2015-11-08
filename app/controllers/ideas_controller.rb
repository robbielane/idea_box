class IdeasController < ApplicationController
  before_action :set_user
  before_action :set_idea, only: [:show, :destroy, :edit, :update]

  def index
    @ideas = @user.ideas
  end

  def new
    @idea = @user.ideas.new
  end

  def create
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:notice] = "Successfully created idea!"
      redirect_to @idea
    else
      flash[:error] = @idea.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
  end

  def destroy
    @idea.destroy
    flash[:notice] = "Successfully deleted idea"
    redirect_to ideas_path
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      flash[:notice] = "Successfully updated idea!"
      redirect_to @idea
    else
      flash[:error] = @idea.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :body, :category_id)
  end
end
