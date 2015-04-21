class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :venue, :address
      t.string :desc_summary
      t.string :desc_note_1, :desc_note_2, :desc_note_3
      t.integer :price_per_person, default: 0
      t.string :image
      t.datetime :experience_at

      t.timestamps null: false
    end
  end
end
