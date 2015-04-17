class CreateChildrenInterests < ActiveRecord::Migration
  def change
    create_table :children_interests do |t|
      t.belongs_to :child
      t.belongs_to :interest

      t.timestamps null: false
    end
  end
end
