files = [
  "helpers.rb",
  "dungeontavern.rb",
  "models/char_extensions.rb",
  "models/dungeon_contract.rb",
  "models/dungeon_run.rb",
  "models/run_participant.rb",
  "models/tavern_night.rb",
  "models/tavern_participant.rb",
  "models/lead_model.rb",
  "commands/tavern_cmd.rb",
  "commands/dungeon_cmd.rb",
  "commands/lead_cmd.rb",
  "commands/leads_cmd.rb",
  "commands/contract_cmd.rb",
  "web/container_web.rb",
  "web/jobboard_web.rb",
  "locale/en.yml"
]

files.each do |file|
  path = File.join(__dir__, file)
  next unless File.exist?(path)
  content = File.read(path)
  
  content.gsub!("AresMUSH::HeroesGuild", "AresMUSH::DungeonTavern")
  content.gsub!("module HeroesGuild", "module DungeonTavern")
  content.gsub!("HeroesGuild.", "DungeonTavern.")
  content.gsub!('Global.read_config("heroesguild"', 'Global.read_config("dungeontavern"')
  content.gsub!('read_config("heroesguild"', 'read_config("dungeontavern"')
  
  File.write(path, content)
end
puts "Update complete."
