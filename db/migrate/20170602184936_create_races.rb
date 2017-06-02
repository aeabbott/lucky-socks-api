class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.string :name
      t.float :distance
      t.integer :time
      t.date :race_day
      t.string :location
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
