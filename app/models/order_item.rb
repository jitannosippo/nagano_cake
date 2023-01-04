class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum made_status: { impossible: 1, wait: 2, making: 3, finished: 4 }
end
