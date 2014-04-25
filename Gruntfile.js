module.exports = function(grunt) {

  "use strict";

  grunt.initConfig({ 
  
    libFiles: [
      "src/**/*.purs",
      "bower_components/purescript-*/src/**/*.purs",
    ],
    
    clean: {
      dedupe: ["bower_components/purescript-either"],
      lib: ["js", "externs"]
    },
  
    pscMake: ["<%=libFiles%>"],
    dotPsci: ["<%=libFiles%>"]
    
  });

  grunt.loadNpmTasks("grunt-contrib-clean");
  grunt.loadNpmTasks("grunt-purescript");
  
  grunt.registerTask("make", ["clean:dedupe", "pscMake", "dotPsci"]);
  grunt.registerTask("default", ["make"]);
};
