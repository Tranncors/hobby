class CreateCities < ActiveRecord::Migration
  def up
    create_table :cities do |t|
      t.json :airport, default: {}
    end
  end
  def down
    drop_table :cities
  end
end
