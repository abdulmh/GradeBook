class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :fullname
      t.string :email

      t.timestamps
    end
  end
end
