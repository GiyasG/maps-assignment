(function() {
  "use strict";

  angular
    .module("spa-demo.subjects")
    .factory("spa-demo.subjects.ThingTag", ThingTagFactory);

  ThingTagFactory.$inject = ["$resource", "spa-demo.config.APP_CONFIG"];
  function ThingTagFactory($resource, APP_CONFIG) {
    return $resource(APP_CONFIG.server_url + "/api/things/:id/tags",
      {thing_id: '@thing_id'},
      {query: { cache:false, isArray:false }
    });
    }
})();
