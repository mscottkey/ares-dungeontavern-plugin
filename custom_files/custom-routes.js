export default function(router) {
  router.route('dungeontavern-board', { path: '/dungeontavern/board' });
  router.route('dungeontavern-dungeon', { path: '/dungeontavern/dungeon/:run_id' });
  router.route('dungeontavern-jobboard', { path: '/dungeontavern/jobboard' });
  router.route('dungeontavern-tavern', { path: '/dungeontavern/tavern/:night_id' });
}
