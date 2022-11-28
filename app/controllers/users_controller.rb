class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @item = @user.items
    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)  # ログイン中のユーザーのお気に入りのItem_idカラムを取得
    @favorite_list = Item.find(favorites)     # Itemsテーブルから、お気に入り登録済みのレコードを取得
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Stock App!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def back
  end

  def confirm
  end

  def complete
  end

  private

    def user_params
      params.require(:user).permit(:login_id,:password,:password_confirmation)
    end

end
