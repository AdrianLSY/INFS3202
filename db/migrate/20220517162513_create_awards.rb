class CreateAwards < ActiveRecord::Migration[7.0]
  def change
    create_table :awards do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :post, foreign_key: true, null: true
      t.belongs_to :comment, foreign_key: true, null: true
      t.integer :type, :default => 0
      t.timestamps
    end
  end
end
