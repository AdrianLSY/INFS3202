class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    has_ancestry
    belongs_to :commentable, polymorphic: true
end
