class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :theater
      t.string :address
      t.string :description
      t.string :director
      t.string :rating
      t.integer :price_per_person, default: 15
      t.string :image
      t.datetime :movie_at

      t.timestamps null: false
    end
  end
end
