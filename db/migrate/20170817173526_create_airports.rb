class CreateAirports < ActiveRecord::Migration
  def up
    create_table :airports do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :iata
      t.string :icao
      t.decimal :latitude, {:precision=>10, :scale=>6}
      t.decimal :longitude, {:precision=>10, :scale=>6}
      t.integer :altitude
      t.integer :timezone
      t.string :dst
    end
  end
  def down
    drop_table :airports
  end
end
