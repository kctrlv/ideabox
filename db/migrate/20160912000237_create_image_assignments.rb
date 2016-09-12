class CreateImageAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :image_assignments do |t|
      t.references :idea, foreign_key: true
      t.references :image, foreign_key: true
      t.timestamps
    end
  end
end
