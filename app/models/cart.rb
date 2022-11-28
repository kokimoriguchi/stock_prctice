class Cart < ApplicationRecord
    belongs_to :user
    belongs_to :item

    attribute :item_num, default: 1 #item_numのデフォルトの個数を１に設定している。カート内の編集にて個数の変更

end
