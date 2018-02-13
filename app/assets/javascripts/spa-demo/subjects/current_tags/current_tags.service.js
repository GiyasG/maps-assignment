(function() {
  "use strict";

  angular
    .module("spa-demo.subjects")
    .service("spa-demo.subjects.currentTags", CurrentTags);

  CurrentTags.$inject = ["$resource", "spa-demo.config.APP_CONFIG"];
  function CurrentTags($resource, APP_CONFIG) {
    return $resource(APP_CONFIG.server_url + "/api/tags/:id");
  }
})();
