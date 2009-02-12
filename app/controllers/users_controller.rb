class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #@stories_submitted = @user.stories.find(:all, :limit => 6, :order => 'stories.id DESC')
    #@stories_voted_on = @user.stories_voted_on.find(:all, :limit => 6, :order => 'votes.id DESC')
  end
  
  def index
    @users = User.all(:limit => 10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created profile image."
      redirect_to @user
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
end