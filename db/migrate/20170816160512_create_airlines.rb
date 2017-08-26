class CreateAirlines < ActiveRecord::Migration
  def up
    create_table :airlines do |t|
      t.string :iata
      t.string :name
    end
  end
  def down
    drop_table :airlines
  end
end
