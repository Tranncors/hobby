class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :h1
      t.text :h2
      t.text :h3
      t.text :href
    end
  end
end
