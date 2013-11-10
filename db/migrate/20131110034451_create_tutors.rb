class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.belongs_to :user
      t.integer :times

      t.timestamps
    end
  end
end
