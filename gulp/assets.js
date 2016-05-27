var path = require('path');
var gulp = require('gulp');
var conf = require('./conf');

//move assets
var buildAssetsScripts = function () {
    return gulp.src([conf.paths.src+'/assets/**/*'])
        .pipe(gulp.dest(conf.paths.tmp+'/serve/assets/'));
};

gulp.task('assets', function() {
    return buildAssetsScripts();
});