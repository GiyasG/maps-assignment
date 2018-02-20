(function() {
  "use strict";

  angular
    .module("spa-demo.subjects")
    .component("sdCurrentTags", {
      templateUrl: tagsTemplateUrl,
      controller: CurrentTagsController,
    })
    ;

  tagsTemplateUrl.$inject = ["spa-demo.config.APP_CONFIG"];
  function tagsTemplateUrl(APP_CONFIG) {
    return APP_CONFIG.current_tags_html;
  }

  CurrentTagsController.$inject = ["$scope",
                                     "spa-demo.subjects.currentTags",
                                     "spa-demo.subjects.currentSubjects",];
  function CurrentTagsController($scope, currentTags, currentSubjects) {
    var vm = this;
    vm.currentIndex = 0;

    vm.$onInit = function() {
      console.log("CurrentTagsController",$scope);
      vm.tags = currentTags.query();
      console.log("query tags", vm.tags);
      vm.tags.$promise.then(function(){
      vm.currentIndex = vm.tags[0].id;
      return currentSubjects.refreshTags(vm.tags[0].id);
    }).then(function(){
      currentSubjects.setCurrentThing(0);
    })
    }

    vm.tagClicked = function(id) {
      console.log('tagClicked', id);
      vm.currentIndex = id;
      currentSubjects.refreshTags(id).then(function(){
      currentSubjects.setCurrentThing(0);
    });
    }
  }
})();
