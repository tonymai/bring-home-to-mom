class CreatePlaydates < ActiveRecord::Migration
  def change
    create_table :playdates do |t|
      t.integer  :initiator_id, :acceptee_id
      t.string   :status, default: 'pending'
      t.string   :venue, :address
      t.datetime :playdate_at
      t.integer  :budget
      t.string   :note

      t.timestamps null: false
    end
  end
end
