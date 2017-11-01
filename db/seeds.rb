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
countries = Country.create([
    { country_code: '61', panel_provider_id: 1 },
    { country_code: '45', panel_provider_id: 3 }])

country = Country.create({ country_code: '381', panel_provider_id: 2 })


#locations and location_groups initial data
location_group1 = LocationGroup.create({name: 'LocationGroup1', panel_provider_id: 1, country_id: 1 })
location_group1.country = country
location_group1.locations.create([{ name: 'Location1', external_id: 1, secret_code: "1" },
                                    { name: 'Location2', external_id: 2, secret_code: "2" },
                                    { name: 'Location3', external_id: 3, secret_code: "3" }])
location_group1.save
