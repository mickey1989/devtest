class CreatePanelProviders < ActiveRecord::Migration
  def change
    create_table :panel_providers do |t|
      t.string :code
      
      t.timestamps null: false
    end
  end
end
