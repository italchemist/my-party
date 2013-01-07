class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.integer :order
      t.references :party
    end
    add_index :activities, :party_id
  end
end
