class AddLowerIndexesToAirlines < ActiveRecord::Migration
  def up
      execute %{
        CREATE INDEX
         airlines_iata
        ON
         airlines (iata)
      }
      execute %{
        CREATE INDEX
         airlines_name
        ON
         airlines (name)
      }
  end
  def down
      remove_index :airlines, name: 'airlines_iata'
      remove_index :airlines, name: 'airlines_name'
  end
end
