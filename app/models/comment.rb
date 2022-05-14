class Comment < ApplicationRecord
    has_ancestry

    belongs_to :post
    belongs_to :user
    
end
