class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.text :assignmentname
      t.text :totalpoints

      t.timestamps
    end
  end
end
