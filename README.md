# Dungeon Tavern Plugin

This plugin provides the Dungeon Tavern system for AresMUSH, including job boards, tavern nights, dungeon runs, and character extensions.

## Prerequisites

**Requires `ares-pbta-plugin` to be installed first.**

The Dungeon Tavern plugin works in tandem with the Powered by the Apocalypse Game system (PbtA) plugin, but it does not include the PbtA core files directly. They must be installed and configured prior to using this plugin.

## What Dungeon Tavern Adds

This plugin adds the following features on top of a standard AresMUSH installation and the PbtA plugin:

- **Guild & Job Board:** Manage dungeon contracts, leads, and jobs.
- **Tavern Nights & Carousing:** Mechanics for character downtime, drinking, and gaining leads.
- **Dungeon Runs:** Instanced tracking for parties running contracts and dungeon dives, including specific roles.
- **Character Extensions:** Additional data fields tracking leads, stress, or other guild-specific currencies.

## Installation & Configuration

### Manual Merge Steps for Custom Hooks

Because this plugin integrates deeply with existing ares systems (especially PbtA), you will need to manually hook into certain files:

1. Look for existing hooks in `ares-pbta-plugin` or your game's custom systems where custom dice rolls, stat resolution, or downtime actions occur.
2. Manually merge the relevant Heroes Guild methods if your game requires custom overrides.
3. Review `custom_files/` additions to see what logic is directly injected.

### Groups Config for Playbook

You must configure a group for character "Playbooks" in your game's configuration. Ensure that your `groups.yml` has a group designated for the various Playbooks your guild members will be taking, allowing the plugin to correctly parse and utilize these roles.

### Chargen Stage Addition

To fully utilize the Heroes Guild plugin, you should add the relevant stage to your Character Generation sequence so players can select their Playbook and initial Guild details.

1. Open your `chargen.yml`.
2. Add the custom Heroes Guild chargen stage to the list of required/optional stages.
3. Restart your Ares server or reload the configuration.
