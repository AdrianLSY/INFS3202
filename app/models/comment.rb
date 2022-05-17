class Comment < ApplicationRecord
    validates_presence_of :body

    has_ancestry

    belongs_to :post
    belongs_to :user
    
    has_many :awards, dependent: :destroy

end
