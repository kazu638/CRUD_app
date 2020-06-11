class UsersController < ApplicationController
  def index
    @users = User.all.order(id: "ASC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "#{@user.name}様の情報が登録されました"
      redirect_to action: :index
    else
      flash[:alert] = "ユーザー情報が登録できませんでした。"
      # renderでもnewは表示できるが、"users"のパスを渡しているため、再読み込みするとindexのビューに飛ぶ。
      # そのためリダイレクトで処理
      redirect_to action: :new  
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "更新できました。"
      redirect_to action: :show
    else
      flash[:alert] = "更新できませんでした。"
      redirect_to action: :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "#{user.name}様の情報を削除しました。"
      redirect_to action: :index
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :age, :message)
    end
end