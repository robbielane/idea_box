class IdeasController < ApplicationController
  before_action :set_user

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
    @idea = Idea.find(params[:id])
  end

  def destroy
    @idea = @user.ideas.find(params[:id])
    @idea.destroy
    flash[:notice] = "Successfully deleted idea"
    redirect_to ideas_path
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
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

  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end
