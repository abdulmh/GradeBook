class AddCourseidToAssignment2 < ActiveRecord::Migration[7.0]
  def change
    add_column :assignment2s, :courseid, :integer
  end
end
