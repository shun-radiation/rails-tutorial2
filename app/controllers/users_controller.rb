class UsersController < ActionController::Base
  def index
    @users = User.all
  end
  def show
    # params["id"]    show#:idのidを取得できる。
    @user = User.find(params["id"])
  end
end
