class OrderItem < ApplicationRecord

    belongs_to :item
    enum production_status: {"制作不可": 0, "制作待ち": 1,"制作中": 2, "制作完了": 3}

    def localed_production_statuses
        production_status.keys.map do |k|
            [ApplicationController.helpers.t("production_status.order_item.#{k}"), k]
        end
    end

end
