import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';

export default Route.extend({
  gameApi: service(),
  model() {
    return this.gameApi.requestOne('dungeontavernJobBoard', {}, null);
  }
});
