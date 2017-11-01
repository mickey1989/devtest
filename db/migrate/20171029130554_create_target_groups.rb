class CreateTargetGroups < ActiveRecord::Migration
  def change
    create_table :target_groups do |t|
      t.string :name
      t.integer :external_id
      t.string :secret_code
      t.belongs_to :panel_provider, index: true
      t.references :parent, index: true
      t.timestamps null: false
    end
    create_table :countries_target_groups, id: false do |t|
      t.belongs_to :country, index: true
      t.belongs_to :target_group, index: true
    end
  end
end
