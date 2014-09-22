
module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch: {
      files: ['sketch/sketch.pde'],
      tasks: ['shell']
    },
    shell: {
        build: {
            command: 'processing-java --run --output='+__dirname+'/build --sketch='+__dirname+'/sketch --force'
        }
    }
  });

  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.registerTask('default', ['watch']);
  grunt.registerTask('build', ['shell']);
};