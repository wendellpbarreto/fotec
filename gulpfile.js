// include gulp
var gulp  = require('gulp');
var gutil = require('gulp-util');

// plugins
var changed  = require('gulp-changed');
var coffee   = require('gulp-coffee');
var imagemin = require('gulp-imagemin');
var sass     = require('gulp-sass');

// input directories
var coffee_src   = 'fotec/assets/scripts/*.coffee';
var imagemin_src = 'fotec/assets/images/**/*';
var sass_src     = 'fotec/assets/stylesheets/**/*.scss';

// output directories
var coffee_dist   = 'fotec/assets/scripts/';
var imagemin_dist = 'fotec/assets/images/';
var sass_dist     = 'fotec/assets/stylesheets/';

// compile coffeescript
gulp.task('coffee:compile', function () {
    gulp.src(coffee_src)
        .pipe(coffee({bare: true}).on('error', gutil.log))
        .pipe(gulp.dest(coffee_dist));
});

// compress images
gulp.task('images:compress', function () {
    gulp.src(imagemin_src)
        .pipe(changed(imagemin_dist))
        .pipe(imagemin())
        .pipe(gulp.dest(imagemin_dist));
});

// compile sass
gulp.task('sass:compile', function () {
    gulp.src(sass_src)
        .pipe(sass({errLogToConsole: true}))
        .pipe(gulp.dest(sass_dist));
});

// serve
gulp.task('dev', ['coffee:compile', 'images:compress', 'sass:compile'], function () {
    gulp.watch(coffee_src, ['coffee:compile']);
    gulp.watch(imagemin_src, ['images:compress']);
    gulp.watch(sass_src, ['sass:compile']);
});

// run all
gulp.task('default', function () {
    gutil.log('No default task registered.');
});
