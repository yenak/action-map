namespace :sample_map do
  desc "Populates county map of California with random values"
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
    i_activities = ['i_active', 'i_semi-active', 'i_neutral', 'i_semi-inactive', 'i_inactive']
    gc_activities = ['gc_active', 'gc_semi-active', 'gc_neutral', 'gc_semi-inactive', 'gc_inactive']
    e_activities = ['e_active', 'e_semi-active', 'e_neutral', 'e_semi-inactive', 'e_inactive']
    counties.each do |county|
      states_id = State.where(symbol: 'CA').first.id
      County.create(name: county, states_id: states_id, activity: activities[rand(5)],
      immigration_activity: i_activities[rand(5)], 
      gun_control_activity: gc_activities[rand(5)], 
      environment_activity: e_activities[rand(5)])
    end
  end

  desc "Clears values of all counties"
  task depopulate_counties: :environment do
    County.destroy_all
  end

  desc "Populates county map of VA with random values"
  task populate_va: :environment do
    counties = ["Accomack", "Northampton", "Buchanan", "Tazewell", "Smyth",
      "Bristol", "Washington", "Russell", "Norton", "Wise", "Dickenson",
      "Scott", "Lee", "Bland", "Grayson", "Galax", "Wythe", "Giles", "Radford",
      "Pulaski", "Falls_Church", "Arlington", "Carroll", "Henry", "Patrick",
      "Floyd", "Montgomery", "Salem", "Franklin_County", "Roanoke_County",
      "Bedford_County", "Alleghany", "Craig", "Botetourt", "Amherst", "Rockbridge",
      "Bath", "Highland", "Greene", "Rockingham", "Augusta", "Nelson",
      "Buckingham", "Appomattox", "Campbell", "Halifax", "Pittsylvania",
      "Martinsville", "Danville", "Lynchburg", "Bedford", "Roanoke", "Buena_Vista",
      "Covington", "Lexington", "Waynesboro", "Staunton", "Charlottesville",
      "Harrisonburg", "Albemarle", "Fluvanna", "Cumberland", "Prince_Edward",
      "Charlotte", "Mecklenburg", "Colonial_Heights", "Lunenburg", "Hopewell",
      "Alexandria", "Page", "Shenandoah", "Clarke", "Winchester", "Frederick",
      "Warren", "Rappahannock", "Madison", "Orange", "Louisa", "Goochland",
      "Powhatan", "Amelia", "Nottoway", "Brunswick", "Dinwiddie", "Emporia",
      "Greensville", "Poquoson", "Franklin", "Southampton", "Hampton",
      "Williamsburg", "Newport_News", "Portsmouth", "York", "James_City",
      "Surry", "Sussex", "Prince_George", "Petersburg", "Henrico", "Chesterfield",
      "Charles_City", "New_Kent", "Richmond", "Fredericksburg", "Fairfax",
      "Manassas", "Loudoun", "Fauquier", "Culpeper", "Spotsylvania", "Hanover",
      "King_William", "King_and_Queen", "Middlesex", "Gloucester", "Lancaster",
      "Richmond_County", "Essex", "Caroline", "Fairfax_County", "Prince_William",
      "Stafford", "King_George", "Westmoreland", "Northumberland", "Mathews",
      "Norfolk", "Isle_of_Wight", "Suffolk", "Chesapeake", "Virginia_Beach",
      "Manassas_Park"]
    activities = ['active', 'semi-active', 'neutral', 'semi-inactive', 'inactive']
    i_activities = ['i_active', 'i_semi-active', 'i_neutral', 'i_semi-inactive', 'i_inactive']
    gc_activities = ['gc_active', 'gc_semi-active', 'gc_neutral', 'gc_semi-inactive', 'gc_inactive']
    e_activities = ['e_active', 'e_semi-active', 'e_neutral', 'e_semi-inactive', 'e_inactive']
    counties.each do |county|
      states_id = State.where(symbol: 'VA').first.id
      County.create(name: county, states_id: states_id, activity: activities[rand(5)],
      immigration_activity: i_activities[rand(5)], 
      gun_control_activity: gc_activities[rand(5)], 
      environment_activity: e_activities[rand(5)])
    end
  end
end
