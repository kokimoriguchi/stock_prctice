class ItemsController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @items = pagy(Item.all, items: 5)
  end

  def new
    @item = Item.new
    @log = @item.logs.new
  end

  def confirm
    @item = Item.new(item_params)
    #ここにLOGの定義が必要
  end

  def create
    #<!--入力画面-->
    @item = Item.new(item_params)
    if params[:back] || @item.save
      redirect_to action: :complete
    else
      flash.now[:danger] = "登録に失敗しました"
      render items_confirm_path
    end
  end

  def complete
  end

  def back
    @item = Item.new(item_params)
    render :new
  end

  def show
    favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)  # ログイン中のユーザーのお気に入りのItem_idカラムを取得
    @favorite_list = Item.find(favorites)     # Itemsテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "編集完了しました"      
      redirect_to action: :index
    else
      flash.now[:danger] = "編集に失敗しました"
      render 'edit'
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:success] = "削除しました"
    redirect_to action: :index
  end
  private

  def item_params
    params.require(:item).permit(:product_name, :arrival_source, :manufactuer, :price, logs_attributes: [:email, :tel, :_destroy, :id])
  end
  
end
