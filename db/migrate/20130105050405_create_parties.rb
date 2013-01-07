class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.string :location
    end
  end
end
