class CreateCourse2s < ActiveRecord::Migration[7.0]
  def change
    create_table :course2s do |t|
      t.string :course_name

      t.timestamps
    end
  end
end
