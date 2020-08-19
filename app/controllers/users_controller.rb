class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index ,:edit, :update, :destroy,
                                        :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  # def index
  #   @users = User.paginate(page: params[:page])
  # end

  def index
    if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
      @q = User.ransack(search_params, activated_true: true)
      @title = "Search Result"
    else
      @q = User.ransack(activated_true: true)
      @title = "All users"
    end
    @users = @q.result.paginate(page: params[:page])
  end

  # def show
  #   @user = User.friendly.find(params[:id])
  #   @microposts = @user.microposts.paginate(page: params[:page])
  # end

  def show
    @user = User.friendly.find(params[:id])
    # @microposts = @user.microposts.paginate(page: params[:page])
    # redirect_to root_url and return unless @user.activated?
    @micropost = current_user.microposts.build
    if params[:q] && params[:q].reject { |key, value| value.blank? }.present?
      @q = @user.microposts.ransack(microposts_search_params)
      @feed_items = @q.result.paginate(page: params[:page])
    else
      @q = Micropost.none.ransack
      @feed_items = @user.microposts.paginate(page: params[:page])
    end
    @url = user_path(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.friendly.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user  = User.friendly.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.friendly.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

   private

    def user_params
      params.require(:user).permit(:name, :username, :email, :password,
                                   :password_confirmation, :admin)
    end

    #before_actionのメソッド

    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.friendly.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    # 検索
    def search_params
      params.require(:q).permit(:name_cont)
    end
end
