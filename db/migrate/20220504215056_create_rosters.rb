class CreateRosters < ActiveRecord::Migration[7.0]
  def change
    create_table :rosters do |t|
      t.references :course2, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
