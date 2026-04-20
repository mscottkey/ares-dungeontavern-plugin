require_relative 'helpers'
require_relative 'models/lead_model'
require_relative 'models/dungeon_contract'
require_relative 'models/tavern_night'
require_relative 'models/tavern_participant'
require_relative 'models/dungeon_run'
require_relative 'models/run_participant'
require_relative 'commands/tavern_cmd'
require_relative 'commands/dungeon_cmd'
require_relative 'commands/lead_cmd'
require_relative 'commands/leads_cmd'
require_relative 'commands/contract_cmd'
require_relative 'web/jobboard_web'
require_relative 'web/container_web'

module AresMUSH
  module DungeonTavern
    def self.plugin_dir
      File.dirname(__FILE__)
    end

    def self.shortcuts
      Global.read_config("dungeontavern", "shortcuts")
    end

    def self.get_cmd_handler(client, cmd, enactor)
      case cmd.root
      when "carouse"                     then return CarouseCmd
      when "imbibe"                      then return ImbibeCmd
      when "sober"                       then return SoberCmd
      when "dungeon"                     then return DungeonCmd
      when "investigate", "lead"         then return LeadCmd
      when "leads"                       then return LeadsCmd
      when "contract"                    then return ContractCmd
      end
      nil
    end

    def self.get_web_request_handler(request)
      case request.cmd  
      when "dtGuildBoard",
           "dungeontavernJobBoard"          then return GuildBoardRequestHandler
      when "dtStartTavernNight"           then return StartTavernNightRequestHandler
      when "dtCloseTavernNight"           then return CloseTavernNightRequestHandler
      when "dtTavernNight"                then return TavernNightRequestHandler
      when "dtTavernAction"               then return TavernActionRequestHandler
      when "dtAddClue"                    then return AddClueRequestHandler
      when "dtStartDungeonRun"            then return StartDungeonRunRequestHandler
      when "dtDungeonRun"                 then return DungeonRunRequestHandler
      when "dtSelectContract"             then return SelectContractRequestHandler
      when "dtEndDungeonRun"              then return EndDungeonRunRequestHandler
      when "dtDungeonGmAction"            then return DungeonGmActionRequestHandler
      when "dtHudRollMove"                then return HudRollMoveRequestHandler
      end
      nil
    end
  end
end
