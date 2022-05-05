class CreateAssignment2s < ActiveRecord::Migration[7.0]
  def change
    create_table :assignment2s do |t|
      t.string :assignmentname
      t.string :totalpoints
      t.string :course2s

      t.timestamps
    end
  end
end
