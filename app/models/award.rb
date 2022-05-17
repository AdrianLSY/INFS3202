class Award < ApplicationRecord
    enum type: %w[gold_coin trophy]

    belongs_to :user
    belongs_to :post, optional: true
    belongs_to :comment, optional: true

end
