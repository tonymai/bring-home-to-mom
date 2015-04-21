class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :venue
      t.string :address
      t.string :desc_summary
      t.string :desc_note_1
      t.string :desc_note_2
      t.string :desc_note_3
      t.integer :price_per_person
      t.string :image
      t.datetime :experience_at

      t.timestamps null: false
    end
  end
end
