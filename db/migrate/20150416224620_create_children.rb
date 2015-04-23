class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string   :first_name, :last_name
      t.string   :city, :state
      t.string   :phone
      t.string   :gender, :sexual_preference, :religion, :pets
      t.date     :birthdate
      t.text     :bio, :embarrassing_moment
      t.boolean  :smoke
      t.string   :linkedin_url, :facebook_url
      t.string   :pf_image_1, :pf_image_2, :pf_image_3, :pf_image_4, :pf_image_5
      t.integer  :main_profile_image
      t.belongs_to :parent

      t.timestamps null: false
    end
  end
end
