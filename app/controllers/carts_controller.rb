class CartsController < ApplicationController
    before_action :set_item, only: [:create, :destroy,]

    def index
        carts = Cart.where(user_id: current_user.id).pluck(:item_id)  # ログイン中のユーザーのカートに入っているItem_idカラムを取得
        @cart = Item.find(carts)    # Itemsテーブルから、上で定義したカートに入っているレコードを取得
        cart = Cart.find_by(params[:id])
        @cart_id = cart.id
    end
    
    def update
        @cart = Cart.find(params[:id])
        @cart.save
            respond_to do |format|
            format.js
        end
    end

    def create
        @cart = Cart.create(user_id: current_user.id, item_id: @item.id)
    end

    def destroy
        @cart = Cart.find_by(user_id: current_user.id, item_id: @item.id)
        @cart.destroy
    end

    private
    def set_item
        @item= Item.find(params[:item_id])
    end

    def cart_params
      params.require(:item).permit([:cart_id, :item_num])
    end

end
