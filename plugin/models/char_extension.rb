  module AresMUSH
    class Character
      collection :pbta_leads,          "AresMUSH::PbtaLead"
      collection :dungeon_contracts,   "AresMUSH::DungeonContract"
      collection :tavern_participants, "AresMUSH::TavernParticipant"
      collection :run_participants,    "AresMUSH::RunParticipant"
    end
  end