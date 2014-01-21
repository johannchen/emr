module.exports = function(config) {
  config.set({
    basePath: '../..',

    frameworks: ['jasmine'],

    autoWatch: true,

    preprocessors: {
      '**/*.coffee': 'coffee'
    }, 

    files: [
      'app/assets/javascripts/lib/angular.js',
      'app/assets/javascripts/lib/angular-mocks.js',
      'app/assets/javascripts/lib/angular-route.js',
      'app/assets/javascripts/emr.js.coffee',
      'app/assets/javascripts/controllers/PatientsController.js.coffee',
      'spec/javascripts/*_spec.js.coffee'
    ]  
  });
};
