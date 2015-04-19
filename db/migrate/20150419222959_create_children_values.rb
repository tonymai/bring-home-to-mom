class CreateChildrenValues < ActiveRecord::Migration
  def change
    create_table :children_values do |t|
      t.belongs_to :child
      t.belongs_to :value

      t.timestamps null: false
    end
  end
end
