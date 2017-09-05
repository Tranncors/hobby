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
      execute %{
         CREATE INDEX
         airports_lower_name
         ON
         airports (lower(name) varchar_pattern_ops);
      }
      execute %{
         CREATE INDEX
         airports_lower_city
         ON
         airports (lower(city) varchar_pattern_ops);
      }
      execute %{
         CREATE INDEX
         airports_lower_country
         ON
         airports (lower(country) varchar_pattern_ops)
      }
      execute %{
        CREATE INDEX
        airports_lower_iata
        ON
        airports (lower(iata))
      }
  end
  def down
      remove_index :airports, name: 'airports_name'
      remove_index :airports, name: 'airports_city'
      remove_index :airports, name: 'airports_country'
      remove_index :airports, name: 'airports_iata'
      remove_index :airports, name: 'airports_lower_name'
      remove_index :airports, name: 'airports_lower_city'
      remove_index :airports, name: 'airports_lower_country'
      remove_index :airports, name: 'airports_lower_iata'
  end
end
