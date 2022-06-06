const { defineConfig } = require("cypress");

module.exports = defineConfig({
  screenshotsFolder: "tmp/cypress_screenshots",
  trashAssetsBeforeRuns: false,
  videosFolder: "tmp/cypress_videos",

  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
});
