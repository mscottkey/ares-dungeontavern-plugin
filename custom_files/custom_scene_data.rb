module AresMUSH
  module Scenes
    module CustomSceneData
      def self.custom_scene_data(scene, enactor)
        # ── PbtA data (requires ares-pbta-plugin) ──────────────────
        stats = enactor.pbta_stats || {}
        
        stat_list = PbtA.stat_names.map do |s|
          val = (stats[s] || 0).to_i
          { key: s, name: s.capitalize,
            display: val >= 0 ? "+#{val}" : val.to_s }
        end

        pbta_data = {
          stats: stat_list,
          all_moves: PbtA.char_moves_for_web(enactor),
          role: enactor.pbta_role
        }

        # ── DungeonTavern container data ───────────────────────────
        room  = scene.room
        run   = room ? DungeonTavern.active_dungeon_run(room)  : nil
        night = room ? DungeonTavern.active_tavern_night(room) : nil

        dt_data = {
          dungeon_run_id:  run   ? run.id   : nil,
          tavern_night_id: night ? night.id : nil
        }

        { pbta: pbta_data, dungeontavern: dt_data }
      end
    end
  end
end
