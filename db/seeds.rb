play_action_groups = [
  { name: 'Two Point Field Goals', is_pinned: true, active: true, actions: [
    { name: '2pt Made', points: 2, requires_coordinates: true, requires_fouls: false, requires_subsitutions: false },
    { name: '2pt Missed', points: 0, requires_coordinates: true, requires_fouls: false, requires_subsitutions: false },
  ] },
  { name: 'Three Point Field Goals', is_pinned: true, active: true, actions: [
    { name: '3pt Made', points: 3, requires_coordinates: true, requires_fouls: false, requires_subsitutions: false },
    { name: '3pt Missed', points: 0, requires_coordinates: true, requires_fouls: false, requires_subsitutions: false },
  ] },
  { name: 'Free Throws', is_pinned: true, active: true, actions: [
    { name: 'Free Throw Made', points: 1, requires_coordinates: true, requires_fouls: false, requires_subsitutions: false },
    { name: 'Free Throw Missed', points: 0, requires_coordinates: true, requires_fouls: false, requires_subsitutions: false },
  ] },
  { name: 'Rebounds', is_pinned: false, active: true, actions: [
    { name: 'Defensive Rebound', points: 0, requires_coordinates: false, requires_fouls: false, requires_subsitutions: false },
    { name: 'Offensive Rebound', points: 0, requires_coordinates: false, requires_fouls: false, requires_subsitutions: false },
  ] },
  { name: 'Other Stats', is_pinned: false, active: true, actions: [
    { name: 'Assist', points: 0, requires_coordinates: false, requires_fouls: false, requires_subsitutions: false },
    { name: 'Shot Blocked', points: 0, requires_coordinates: false, requires_fouls: false, requires_subsitutions: false },
    { name: 'Steal', points: 0, requires_coordinates: false, requires_fouls: false, requires_subsitutions: false },
    { name: 'Turnover', points: 0, requires_coordinates: false, requires_fouls: false, requires_subsitutions: false },
  ] },
  { name: 'Personal Fouls', is_pinned: false, active: true, actions: [
    { name: 'Foul Committed', points: 0, requires_coordinates: false, requires_fouls: true, requires_subsitutions: false },
    { name: 'Foul Forced', points: 0, requires_coordinates: false, requires_fouls: true, requires_subsitutions: false },
  ] },
  { name: 'Substitutions', is_pinned: false, active: false, actions: [
    { name: 'Sub In', points: 0, requires_coordinates: false, requires_fouls: false, requires_subsitutions: true },
    { name: 'Sub Out', points: 0, requires_coordinates: false, requires_fouls: false, requires_subsitutions: true },
  ] },
  { name: 'Put Backs', is_pinned: true, active: true, actions: [
    { name: 'Put Back Made', points: 2, requires_coordinates: true, requires_fouls: false, requires_subsitutions: false },
    { name: 'Put Back Missed', points: 0, requires_coordinates: true, requires_fouls: false, requires_subsitutions: false },
  ] },
]

play_action_groups.each_with_index do |play_action_group, idx|
  pag = PlayActionGroup.find_or_initialize_by(name: play_action_group[:name])
  pag.is_pinned = play_action_group[:is_pinned]
  pag.active = play_action_group[:active]
  pag.sort_order = idx
  pag.save!
  # puts pag.name

  play_action_group[:actions].each_with_index do |action, aidx|
    a = PlayAction.find_or_initialize_by(play_action_group: pag, name: action[:name])
    a.points = action[:points]
    a.requires_coordinates = action[:requires_coordinates]
    a.requires_substitutions = action[:requires_subsitutions]
    a.requires_fouls = action[:requires_fouls]
    a.active = true
    a.sort_order = aidx
    a.save!
  end
end

fouls = [
  {"name"=>"None specified","description"=>nil,"is_technical"=>"0"},
  {"name"=>"Holding","description"=>"When a player stops the opponent from moving by holding them.","is_technical"=>"0"},
  {"name"=>"Illegal Screen/Pick","description"=>"If the player doesn’t maintain the position while setting screen or pick.","is_technical"=>"0"},
  {"name"=>"Hand Check","description"=>"The defender usually commits this foul. It happens when they continuously stop the opponent by using their hands.","is_technical"=>"0"},
  {"name"=>"Illegal Hand Use","description"=>"Similar to holding; when a player touches the opponent\'s hands or arms illegally, it is considered a personal foul.","is_technical"=>"0"},
  {"name"=>"Tripping","description"=>"When a player uses their leg or foot to trip the opponent.","is_technical"=>"0"},
  {"name"=>"Elbowing","description"=>"A player uses their elbow to hit another player.","is_technical"=>"0"},
  {"name"=>"Charging","description"=>"A defender stands in front of the opponent, and the offensive player touches the defender. If the defender is standing outside the charge circle, it is foul.","is_technical"=>"0"},
  {"name"=>"Blocking","description"=>"When the defender is not positioned inside the charge circle and still makes contact with the offensive player.","is_technical"=>"0"},
  {"name"=>"Unsportsmanlike Conduct","description"=>"When the players or coaches show unsportsmanlike conduct like taunting the other team, using profane language towards any of the officials.","is_technical"=>"1"},
  {"name"=>"More Timeout","description"=>"When the team has used all their allotted timeout, but still calls for a timeout.","is_technical"=>"1"},
  {"name"=>"Illegal Gamesmanship","description"=>"When the game is delayed by the action of a team or player.","is_technical"=>"1"},
  {"name"=>"Illegal Defense","description"=>"When the players are arranged in illegal formation on defense.","is_technical"=>"1"},
  {"name"=>"Flagrant Foul","description"=>"Unnecessary and excessive contact, which leads to the ejection of the player. The contact is brutal, harsh, cruel, and dangerous for a player. The contact can be deliberate or intentional. The player who commits these fouls can be removed from the game. ","is_technical"=>"1"},
];

fouls.each_with_index do |foul, idx|
  f = Foul.find_or_initialize_by(name: foul['name'])
  f.description = foul['description']
  f.is_technical = foul['is_technical']
  f.sort_order = idx
  f.save!
end

periods = [
  { name: "1st", is_overtime: false },
  { name: "2nd", is_overtime: false },
  { name: "3rd", is_overtime: false },
  { name: "4th", is_overtime: false },
  { name: "OT", is_overtime: true },
  { name: "OT2", is_overtime: true },
  { name: "OT3", is_overtime: true },
  { name: "OT4", is_overtime: true },
]

periods.each_with_index do |period, idx|
  p = Period.find_or_initialize_by(name: period[:name])
  p.is_overtime = period[:is_overtime]
  p.sort_order = idx
  p.save!
end

shot_types = [
  { name: "Transition" },
  { name: "Early Offense" },
  { name: "Last Offense" },
  { name: "Buzzer Beater" },
  { name: "BLOB" },
  { name: "SLOB" },
]

shot_types.each_with_index do |shot_type, idx|
  st = ShotType.find_or_initialize_by(name: shot_type[:name])
  st.sort_order = idx
  st.save!
end