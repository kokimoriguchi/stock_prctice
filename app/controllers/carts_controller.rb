class CartsController < ApplicationController
    before_action :set_item, only: [:create, :destroy,]

    def index
        carts = Cart.where(user_id: current_user.id).pluck(:item_id)  # ログイン中のユーザーのカートに入っているItem_idカラムを取得
        @cart_list = Item.find(carts)     # Itemsテーブルから、カートに入っているレコードを取得        
    end
    
    def update
        @cart = Cart.new(cart_params)

        respond_to do |format|
            if @car.save
                format.html {render :index}
                format.js  # update.js.erbが呼び出される
            else
                format.html {render :index}
                format.js
            end
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
      params.require(:cart).permit(:item_num)
    end

end
