class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_items, dependent: :destroy
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum order_status: { wait: 1, confirmation: 2, making: 3, delivering: 4, finished: 5 }
end
