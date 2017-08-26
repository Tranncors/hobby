class AddLowerIndexesToAirports < ActiveRecord::Migration
  def up
      execute %{
        CREATE INDEX
         airports_name
        ON
         airports (name)
      }
      execute %{
        CREATE INDEX
         airports_city
        ON
         airports (city)
      }
      execute %{
        CREATE INDEX
         airports_country
        ON
         airports (country)
      }
      execute %{
        CREATE INDEX
         airports_iata
        ON
         airports (iata)
      }
  end
  def down
      remove_index :airports, name: 'airports_name'
      remove_index :airports, name: 'airports_city'
      remove_index :airports, name: 'airports_country'
      remove_index :airports, name: 'airports_iata'
  end
end
