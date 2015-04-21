class CreatePlaydates < ActiveRecord::Migration
  def change
    create_table :playdates do |t|
      t.integer  :initiator_id, :recipient_id
      t.belongs_to :experience
      t.belongs_to :movie
      t.string   :status, default: 'pending' #other options: 'accepted', 'confirmed'.  If recipient rejects playdate, just delete it.
      t.string   :venue, :address
      t.datetime :playdate_at
      t.integer  :budget
      t.string   :note

      t.boolean  :recipient_accepted, default: false
      t.boolean  :initiator_confirmed, default: false
      t.boolean  :recipient_confirmed, default: false
      t.boolean  :initiator_paid, default: false
      t.boolean  :recipient_paid, default: false

      t.timestamps null: false
    end
  end
end
