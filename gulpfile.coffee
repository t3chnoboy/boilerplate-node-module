gulp       = require 'gulp'
gutil      = require 'gulp-util'
mocha      = require 'gulp-mocha'
coffeeES6  = require 'gulp-coffee-es6'

paths =
  lib   : ['src/**/*.coffee', '!src/index.coffee']
  index : ['src/index.coffee']
  dest  : 'lib'

gulp.task 'index', ->
  gulp.src(paths.index)
    .pipe(coffeeES6(bare: yes))
    .pipe(gulp.dest './')

gulp.task 'lib', ->
  gulp.src(paths.lib)
    .pipe(coffeeES6(bare: yes))
    .pipe(gulp.dest paths.dest)

gulp.task 'watch', ->
  gulp.watch paths.lib,  ['lib']

gulp.task 'default', ['index', 'lib', 'watch']
