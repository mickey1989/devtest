class TargetGroup < ActiveRecord::Base
    belongs_to :parent, class_name: "TargetGroup"
    belongs_to :panel_provider
    has_and_belongs_to_many :countries
end
