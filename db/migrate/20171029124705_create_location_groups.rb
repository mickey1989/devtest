class CreateLocationGroups < ActiveRecord::Migration
  def change
    create_table :location_groups do |t|
      t.string :name
      t.belongs_to :panel_provider, index: true
      t.belongs_to :country, index: true
      t.timestamps null: false
    end
    create_table :location_groups_locations, id: false do |t|
      t.belongs_to :location, index: true
      t.belongs_to :location_group, index: true
    end
  end
end
