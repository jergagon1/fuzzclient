'use strict';

var path = require('path');
var gulp = require('gulp');
var conf = require('./conf');

var browserSync = require('browser-sync');

var $ = require('gulp-load-plugins')();


gulp.task('scripts-reload', function() {
  return buildScripts()
    .pipe(browserSync.stream());
});

gulp.task('scripts', function() {
  return buildScripts();
});

//move assets scripts
var buildAssetsScripts = function () {
  return gulp.src([conf.paths.src+'/assets/scripts/**/*'])
      .pipe(gulp.dest(conf.paths.tmp+'/serve/assets/scripts/'));
};

function buildScripts() {
  buildAssetsScripts();
  return gulp.src(path.join(conf.paths.src, '/app/**/*.coffee'))
    .pipe($.sourcemaps.init())
    .pipe($.coffeelint())
    .pipe($.coffeelint.reporter())
    .pipe($.coffee()).on('error', conf.errorHandler('CoffeeScript'))
    .pipe($.sourcemaps.write())
    .pipe(gulp.dest(path.join(conf.paths.tmp, '/serve/app')))
    .pipe($.size())
};
