import Component from '@ember/component';
import { inject as service } from '@ember/service';

// Extends the scene play component with DungeonTavern container controls.
// HUDs open in a new tab so the player keeps the scene view.
export default Component.extend({
  gameApi:       service(),
  flashMessages: service(),

  actions: {
    dtStartDungeonRun() {
      this.gameApi.requestOne('dtStartDungeonRun', { scene_id: this.scene.id }, null)
        .then((result) => {
          if (result.run_id) {
            window.open(`/dungeontavern/dungeon/${result.run_id}`, '_blank');
          } else if (result.error) {
            this.flashMessages.danger(result.error);
          }
        });
    },

    dtEndDungeonRun() {
      const runId = this.custom && this.custom.dungeontavern && this.custom.dungeontavern.dungeon_run_id;
      if (!runId) return;
      this.gameApi.requestOne('dtEndDungeonRun', { run_id: runId }, null)
        .then((result) => {
          if (result.error) {
            this.flashMessages.danger(result.error);
          } else {
            this.flashMessages.success('Dungeon run ended.');
          }
        });
    },

    dtStartTavernNight() {
      this.gameApi.requestOne('dtStartTavernNight', { scene_id: this.scene.id }, null)
        .then((result) => {
          if (result.night_id) {
            window.open(`/dungeontavern/tavern/${result.night_id}`, '_blank');
          } else if (result.error) {
            this.flashMessages.danger(result.error);
          }
        });
    },

    dtCloseTavernNight() {
      const nightId = this.custom && this.custom.dungeontavern && this.custom.dungeontavern.tavern_night_id;
      if (!nightId) return;
      this.gameApi.requestOne('dtCloseTavernNight', { night_id: nightId }, null)
        .then((result) => {
          if (result.error) {
            this.flashMessages.danger(result.error);
          } else {
            this.flashMessages.success('Tavern night closed.');
          }
        });
    }
  }
});
