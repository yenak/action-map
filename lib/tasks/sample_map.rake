namespace :sample_map do
  desc "TODO"
  task populate_ca: :environment do
    counties = ['Alameda','Alpine','Del_Norte_1_','Imperial','Kern','Lassen',
      'Marin','Mendocino','Modoc','Orange','Riverside','San_Bernardino',
      'San_Diego','San_Francisco','San_Mateo','Solano','Amador','Butte',
      'Calaveras','Colusa','Contra_Costa','El_Dorado','Fresno','Glenn',
      'Humboldt','Inyo','Lake','Los_Angeles','Madera','Mariposa','Merced',
      'Mono','Monterey','Napa','Nevada','Placer','Plumas','Sacramento',
      'San_Benito','San_Joaquin','San_Luis_Obispo','Santa_Barbara',
      'Santa_Clara','Santa_Cruz','Shasta','Sierra','Siskiyou','Sonoma',
      'Stanislaus','Sutter','Tehama','Trinity','Tulare','Tuolumne','Ventura',
      'Yolo','Yuba','Kinga']
    activities = ['active', 'semi-active', 'neutral', 'semi-inactive', 'inactive']
    counties.each do |county|
      states_id = State.where(symbol: 'CA').first.id
      County.create(name: county, states_id: states_id, activity: activities[rand(5)])
    end
  end

  desc "TODO"
  task depopulate_ca: :environment do
    County.destroy_all
  end
end
