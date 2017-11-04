# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#panel_providers initial data
panel_providers = PanelProvider.create([
    { code: 'panel1' },
    { code: 'panel2' },
    { code: 'panel3' }])

#countries initial data
country1 = Country.create({ country_code: '381', panel_provider_id: 2 })
country2 = Country.create({ country_code: '61', panel_provider_id: 1 })
country3 = Country.create({ country_code: '45', panel_provider_id: 3 })


#locations and location_groups initial data
location_group1 = LocationGroup.create({name: 'LocationGroup1', panel_provider_id: 1, country_id: 1 })
location_group1.country = country1
location_group1.locations.create([{ name: 'Location1', external_id: 1, secret_code: "1" },
                                    { name: 'Location2', external_id: 2, secret_code: "2" },
                                    { name: 'Location3', external_id: 3, secret_code: "3" }])
location_group1.save

location_group2 = LocationGroup.create({name: 'LocationGroup2', panel_provider_id: 2, country_id: 2 })
location_group2.country = country2
location_group2.locations.create([{ name: 'Location4', external_id: 4, secret_code: "4" }])
location_group2.save


country1.target_groups.create([{name: 'TargetGroup1', external_id: 1, secret_code: "1", panel_provider_id: 2},
                                {name: 'TargetGroup2', external_id: 2, secret_code: "2", panel_provider_id: 2}])

TargetGroup.create([{name: 'TargetGroup3', external_id: 3, secret_code: "3", panel_provider_id: 2, parent_id: 1},
                                {name: 'TargetGroup4', external_id: 4, secret_code: "4", panel_provider_id: 2, parent_id: 1},
                                {name: 'TargetGroup5', external_id: 5, secret_code: "5", panel_provider_id: 2, parent_id: 3},
                                {name: 'TargetGroup6', external_id: 6, secret_code: "6", panel_provider_id: 2, parent_id: 3},
                                {name: 'TargetGroup7', external_id: 7, secret_code: "7", panel_provider_id: 2, parent_id: 4},
                                {name: 'TargetGroup8', external_id: 8, secret_code: "8", panel_provider_id: 2, parent_id: 4},
                                {name: 'TargetGroup9', external_id: 9, secret_code: "9", panel_provider_id: 2, parent_id: 2},
                                {name: 'TargetGroup10', external_id: 10, secret_code: "10", panel_provider_id: 2, parent_id: 2},
                                {name: 'TargetGroup11', external_id: 11, secret_code: "11", panel_provider_id: 2, parent_id: 10},
                                {name: 'TargetGroup12', external_id: 12, secret_code: "12", panel_provider_id: 2, parent_id: 10},
                                {name: 'TargetGroup13', external_id: 13, secret_code: "13", panel_provider_id: 2, parent_id: 11},
                                {name: 'TargetGroup14', external_id: 14, secret_code: "14", panel_provider_id: 2, parent_id: 11}])

country2.target_groups.create([{name: 'TargetGroup15', external_id: 15, secret_code: "15", panel_provider_id: 1}])

TargetGroup.create([{name: 'TargetGroup16', external_id: 16, secret_code: "16", panel_provider_id: 1, parent_id: 15},
                                {name: 'TargetGroup17', external_id: 17, secret_code: "17", panel_provider_id: 1, parent_id: 15},
                                {name: 'TargetGroup18', external_id: 18, secret_code: "18", panel_provider_id: 1, parent_id: 16},
                                {name: 'TargetGroup19', external_id: 19, secret_code: "19", panel_provider_id: 1, parent_id: 16},
                                {name: 'TargetGroup20', external_id: 20, secret_code: "20", panel_provider_id: 1, parent_id: 17},
                                {name: 'TargetGroup21', external_id: 21, secret_code: "21", panel_provider_id: 1, parent_id: 17}])

country3.target_groups.create([{name: 'TargetGroup22', external_id: 22, secret_code: "22", panel_provider_id: 3}])

TargetGroup.create([{name: 'TargetGroup23', external_id: 23, secret_code: "23", panel_provider_id: 3, parent_id: 22},
                                {name: 'TargetGroup24', external_id: 24, secret_code: "24", panel_provider_id: 3, parent_id: 22},
                                {name: 'TargetGroup25', external_id: 25, secret_code: "25", panel_provider_id: 3, parent_id: 23},
                                {name: 'TargetGroup26', external_id: 26, secret_code: "26", panel_provider_id: 3, parent_id: 23},
                                {name: 'TargetGroup27', external_id: 27, secret_code: "27", panel_provider_id: 3, parent_id: 24},
                                {name: 'TargetGroup28', external_id: 28, secret_code: "28", panel_provider_id: 3, parent_id: 24}])