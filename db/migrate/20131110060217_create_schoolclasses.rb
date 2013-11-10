class CreateSchoolclasses < ActiveRecord::Migration
  def change
    create_table :schoolclasses do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
