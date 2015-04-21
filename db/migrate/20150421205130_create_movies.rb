class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :venue, :address
      t.string :title, :description, :director
      t.integer :rating #from rotten tomatoes; out of 100
      t.integer :price_per_person, default: 15
      t.string :image
      t.datetime :movie_at

      t.timestamps null: false
    end
  end
end
