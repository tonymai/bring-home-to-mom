class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.belongs_to :conversation, index: true
      t.belongs_to :parent, index: true

      t.timestamps null: false
    end
  end
end
