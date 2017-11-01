class Country < ActiveRecord::Base
    belongs_to :panel_provider
    has_many :location_groups
    has_and_belongs_to_many :target_groups, 
    -> { where "parent_id IS NULL" }
end
