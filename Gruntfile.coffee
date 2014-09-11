module.exports = (grunt) ->
  require("load-grunt-tasks")(grunt, {pattern: "grunt-*"})

  require("time-grunt")(grunt)
  config =
    app: "app"
    dist: "dist"
    vendor: "bower_components"

  grunt.initConfig
    config: config
    watch:
      templates:
        files: "<%= config.app %>/templates/**/*.jst"
        tasks: ["buildTemplates"]
        options:
          livereload: true

      coffee:
        files: "<%= config.app %>/scripts/**/*.coffee"
        tasks: ["buildScripts"]
        options:
          livereload: true

      sass:
        files: "<%= config.app %>/styles/**/*.scss"
        tasks: ["buildStyles"]
        options:
          livereload: true

      html:
        files: ["<%= config.app %>/*.html"]
        tasks: ["copy:html"]
        options:
          livereload: true
      images:
        files: "<%= config.app %>/images/**/*.{jpg,png,gif}"
        tasks: ["copy:images"]
        options:
          livereload: true
      design:
        files: ["<%= config.app %>/design/**/*.*"]
        tasks: ["copy:design"]
        options:
          livereload: true

    jst:
      build:
        options:
          prettify: true
          amd: true
          processName: (path)->
            path.replace(/^app\/templates\//, '').replace(/\.jst$/, '')
        files:
          "<%= config.dist %>/scripts/templates.js": ["<%= config.app %>/templates/**/*.jst"]

    coffee:
      build:
        options:
          bare: true
        expand: true
        cwd: "<%= config.app %>/scripts"
        src: ["**/*.coffee"]
        dest: "<%= config.dist %>/scripts"
        ext: ".js"

    sass:
      build:
        expand: true
        cwd: "<%= config.app %>/styles"
        src: ["**/*.scss"]
        dest: "<%= config.dist %>/styles"
        ext: ".css"

    compass: {
      options: {
        sassDir: "<%= config.app %>/styles"
        cssDir: "<%= config.dist %>/styles"
        generatedImagesDir: "<%= config.dist %>/images/generated"
        imagesDir: "<%= config.app %>/images"
        javascriptsDir: "<%= config.app %>/scripts"
        fontsDir: "<%= config.app %>/fonts"
        importPath: [
            "<%= config.vendor %>"
        ]
        httpImagesPath: "/images"
        httpGeneratedImagesPath: "/images/generated"
        httpFontsPath: "/fonts"
        sourcemap: true
        relativeAssets: false
        noLineComments: true
        debugInfo: false
      }
      dist: {}
      build: {}
    }
    copy:
      html:
        expand: true
        cwd: "<%= config.app %>"
        src: ["*.html"]
        dest: "<%= config.dist %>/"
      fonts:
        files:[{
          expand: true
          cwd: "<%= config.vendor %>/bootstrap-sass-official/assets/fonts"
          src: ["bootstrap/*.*"]
          dest: "<%= config.dist %>/fonts"
        },{
          expand: true
          cwd: "<%= config.vendor %>/fontawesome/fonts"
          src: ["*.*"]
          dest: "<%= config.dist %>/fonts"
        }]
      images:
        expand: true
        cwd: "<%= config.app %>/images"
        src: "*.*"
        dest: "<%= config.dist %>/images"
      design:
        expand: true
        cwd: "<%= config.app %>"
        src: ["design/**/*.*"]
        dest: "<%= config.dist %>/"

    clean:
      build: ["<%= config.dist %>/*"]

    connect:
      options:
        port: 9000
        open: true
        livereload: 35729
        hostname: "localhost",

      livereload:
        options:
          middleware: (connect)->
            return [
              connect.static("./dist")
              connect().use("/bower_components", connect.static("./bower_components")),
            ]

    concurrent:
      serve: ["execute:serve","watch:serve"]


  #Custom task
  grunt.registerTask "buildTemplates", [
    "jst:build"
  ]
  grunt.registerTask "buildScripts", [
    "coffee:build"
  ]
  grunt.registerTask "buildStyles", [
    "compass:build"
  ]

  grunt.registerTask "build", [
    "clean:build"
    "copy:html"
    "copy:fonts"
    "copy:images"
    "copy:design"
    "buildScripts"
    "buildTemplates"
    "buildStyles"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:livereload"
    "watch"
  ]