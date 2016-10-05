# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  countries = Country.create([{ country_code: 'PL', panel_provider_id: 1 }, { country_code: 'UK', panel_provider_id: 1 }, { country_code: 'GE', panel_provider_id: 1 }])
  
  pps=PanelProvider.create([{ code: 'EmanuelPanel' }, { code: 'PayPalPanel' },{ code: 'LetMePayPanel' }])
  
  locations=Location.create([{ name: 'Mazowieckie', location_group_ids: 1 }, { name: 'Warszawa', location_group_ids: 1 }, { name: 'Łódź', location_group_ids: 1 }, { name: 'Gdańsk', location_group_ids: 1 }, { name: 'Małopolska', location_group_ids: 3 },
                            { name: 'Zakopane', location_group_ids: 2 }, { name: 'Wielkopolska', location_group_ids: 2 }, { name: 'Śląsk', location_group_ids: 2 }, { name: 'Lublin', location_group_ids: 3 }, { name: 'Wrocław', location_group_ids: 2 },
                            { name: 'Lwów', location_group_ids: 3}, { name: 'Szczecin', location_group_ids: 4 }, { name: 'Tatry' , location_group_ids: 2}, { name: 'Bieszczady', location_group_ids: 4 }, { name: 'Pieniny', location_group_ids: 3 } ])
  
  location_groups=LocationGroup.create([{name: "Grupa Jasia", country_id: 1, panel_provider_id: 1}, {name: "Grupa Zbysia", country_id: 2, panel_provider_id: 2},
    {name: "Grupa Zdzisia", country_id: 3, panel_provider_id: 3}, {name: "Grupa Eustachego", country_id: 1, panel_provider_id: 1}])

  root_targets=TargetGroup.create([{name: "TG1", external_id: 1, parent_id: 1, secret_code: '1234', panel_provider_id: 1, country_id: 1},
      {name: "TG2", external_id: 2, parent_id: 2, secret_code: '1234', panel_provider_id: 2, country_id: 2},
       {name: "TG3", external_id: 3, parent_id: 3, secret_code: '1234', panel_provider_id: 3, country_id: 3},
        {name: "TG4", external_id: 2, parent_id: 2, secret_code: '1234', panel_provider_id: 2, country_id: 1}
    ])

  api_key=ApiKey.create(access_token: '1234')