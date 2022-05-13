class CreateUserCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_courses do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.timestamps
    end
  end
end
