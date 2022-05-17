class Award < ApplicationRecord
    enum award_type: %w[gold_coin trophy]

    belongs_to :user
    belongs_to :backer, class_name: "User"

    belongs_to :post, optional: true
    belongs_to :comment, optional: true

end
