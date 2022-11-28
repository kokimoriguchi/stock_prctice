class Item < ApplicationRecord
    has_many :logs, dependent: :destroy 
    accepts_nested_attributes_for :logs, allow_destroy: true

    has_many :favorites, dependent: :destroy
    has_many :users, through: :favorites
    
    has_many :carts, dependent: :destroy
    has_many :buy_items, dependent: :destroy

    with_options presence: true do
        validates :product_name, presence: true
        validates :arrival_source, presence: true
        validates :manufactuer, presence: true
    end

    def create
        @item = params[:item].permit(:product_name, :arrival_source, :manufactuer, :price)
        Item.create(@item)
    end

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    def cart_in?(user)
        carts.where(user_id: user.id).exists?
    end

end
