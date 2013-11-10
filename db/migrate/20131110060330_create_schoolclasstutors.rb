class CreateSchoolclasstutors < ActiveRecord::Migration
  def change
    create_table :schoolclasstutors do |t|
      t.references :schoolclass, index: true
      t.references :tutor, index: true
      t.string :pitch

      t.timestamps
    end
  end
end
