/*
 * grunt-image-diff
 * https://github.com/eduardo.pacheco/image-diff
 *
 * Copyright (c) 2013
 * Licensed under the MIT license.
 */

'use strict';

var path = require('path');
var shell = require('shelljs');
var fs = require('fs-extra');
var request = require('request');
var ProgressBar = require('progress');
var AdmZip = require('adm-zip');
var async = require('async');
var binPath = path.normalize(path.join(__dirname, '../bin/'));
var downloadsFilesShortNames = ["perceptualdiff", "FreeImage", "compare"];
var downloadFiles = [
  {
    url : "http://sourceforge.net/projects/pdiff/files/pdiff/perceptualdiff-1.1.1/perceptualdiff-1.1.1-win.zip/download",
    extractFileName : path.join(binPath, downloadsFilesShortNames[0] + '.exe'),
    fileName : path.join(binPath, downloadsFilesShortNames[0] + '.zip')
  },
  {
    url : "http://sourceforge.net/projects/freeimage/files/Binary%20Distribution/3.17.0/FreeImage3170Win32Win64.zip/download",
    extractFileName : path.join(binPath, downloadsFilesShortNames[1] + '.dll'),
    extractFilePath : "FreeImage/Dist/x32/",
    fileName : path.join(binPath, downloadsFilesShortNames[1] + '.zip')
  },
  {
    //url : "http://www.imagemagick.org/download/binaries/ImageMagick-6.9.1-0-Q16-x86-windows.zip",
    url: "http://mirrors-ru.go-parts.com/mirrors/ImageMagick/binaries/ImageMagick-6.9.1-0-Q16-x86-windows.zip",
    extractFileName : path.join(binPath, downloadsFilesShortNames[2] + '.exe'),
    extractFilePath : "ImageMagick-6.9.1-0/",
    fileName : path.join(binPath, downloadsFilesShortNames[2] + '.zip')
  }
];


module.exports = function(grunt) {

  /**
   * Download file from web.
   *
   * @param {string}   fileTo  - path save a file.
   * @param {string}   urlFrom - url for downloading a file
   * @param {Function} cb      - callback function
   */
  function downloadFile (fileTo, urlFrom, cb, extractFileName, extractFilePath) {
    // Where to save jar to.
    // If it's already there don't download it.
    extractFilePath = extractFilePath || '';
    if (fs.existsSync(extractFileName || fileTo)) {
      return cb(null);
    }

    grunt.log.ok('Saving file to: ' + fileTo);

    var writeStream = fs.createWriteStream(fileTo);

    // Start downloading and showing progress.
    request(urlFrom).on('response', function (res) {
      if(res.statusCode > 200 && res.statusCode < 300) {
        grunt.log.ok("grunt fail");
        grunt.fail.fatal(urlFrom + " returns " + res.statusCode);
      }
      // Full length of file.
      var len = parseInt(res.headers['content-length'], 10);

      // Super nifty progress bar.
      var bar = new ProgressBar(' downloading [:bar] :percent :etas', {
        complete: '=',
        incomplete: ' ',
        width: 20,
        total: len
      });

      // Write new data to file.
      res.on('data', function (chunk) {
        writeStream.write(chunk);
        bar.tick(chunk.length);
      });

      // Close file and holla back.
      res.on('end', function () {
        writeStream.end();
        grunt.log.ok('done.');
        if (extractFileName && path.extname(fileTo) == '.zip'){
          var zip = new AdmZip(fileTo);
          zip.extractEntryTo(extractFilePath + path.basename(extractFileName), binPath, false, true);
          fs.unlink(fileTo);
        }
        cb(null);
      });

      // Download error.
      res.on('error', function (err) {
        cb(err);
      });
    });
  }

  grunt.registerMultiTask('image_diff', 'Grunt implementation of Perceptual Image Diff', function() {
    if (process.platform !== "win32") {
      grunt.log.warn('Only valid in windows, sorry :(.');
      return;
    }

    if (!fs.existsSync(binPath)){
      fs.mkdirSync(binPath);
    }

    var done = this.async();
    var _this = this;
    async.eachSeries(downloadFiles, function(download, cb2){
      downloadFile(download.fileName, download.url, function(error){
        cb2(error);
      }, download.extractFileName, download.extractFilePath);
    }, function(error){
      runImageDiff.call(_this, done);
    });
  });

  function runImageDiff(cb){
    var options = this.options(
      {
        orig         : '_orig',
        test         : '_test',
        diff         : '_diff',
        colorfactor  : '0.0',
        luminanceonly: true
      }
    );

    var perceptualdiff = downloadFiles[0].extractFileName;

    var tests = 0;
    var images = [];

    this.files.forEach(function (f) {
      f.src.forEach(function(orig) {
        var test = orig.replace(options.orig, options.test);
        var diff = orig.replace(options.orig, options.diff);


        if (orig === diff) {
          cb(null);
        }
        if (!grunt.file.exists(test)) {
          grunt.log.warn('Test file "' + test + '" invalid.');
          cb(null);
        }

        tests++;

        var cmd = perceptualdiff + ' "' + orig + '" "' + test + '" -verbose';

        if (options.luminanceonly) {
          cmd += '-luminanceonly ';
        }
        if (options.colorfactor) {
          cmd += '-colorfactor '+ options.colorfactor +' ';
        }
        if (!fs.existsSync(path.dirname(diff))){
          fs.mkdirsSync(path.dirname(diff));
        }
        var result = shell.exec(cmd, {silent:true, async:false}).output;

        var success = false;
        if (result.match(/PASS: /)) {
          result = result.split('PASS: ');
          success = true;
        } else {
          result = result.split('FAIL: ');
        }

        var msg = "Invalid file.";
        if (result && result.length > 1) {
          result = result[1].split("\r\n");
          msg = result[0];
        }

        if ( ! success) {
          grunt.log.warn(orig + ': "' + msg + '" see diff file "' + diff + '"');
          shell.exec(path.join(binPath, "compare.exe") + ' ' + orig + ' ' + test + ' ' + diff, {silent:true, async:false})
          var origFileName = path.basename(orig, path.extname(orig));
          var diffFileName = path.basename(diff, path.extname(diff));
          var testFileName = path.basename(test, path.extname(test));
          var dirName = path.dirname(diff);
          var extName = path.extname(diff);
          images.push({
                        diff : path.relative(options.reportPath, path.join(dirName, diffFileName + ".diff" + extName)),
                        orig : path.relative(options.reportPath, path.join(dirName, diffFileName + ".orig" + extName)),
                        test : path.relative(options.reportPath, path.join(dirName, diffFileName + ".test" + extName)),
                        suite : diffFileName.replace(/_/g, " "),
                        browser : path.relative(options.reportPath, dirName).split("\\")[0],
                        specsPath : path.relative(options.reportPath, dirName).split("\\").slice(1).join(" -> ").replace(/_/g, " "),
                        fullName : path.relative(options.reportPath, dirName).split("\\").slice(1).join(" -> ").replace(/_/g, " ") + " -> " + diffFileName.replace(/_/g, " ")
                      });
          fs.copySync(orig, path.join(
            path.dirname(diff),
            diffFileName + '.orig' + path.extname(diff)
          ));
          fs.copySync(test, path.join(
            path.dirname(diff),
            diffFileName + '.test' + path.extname(diff)
          ));
          fs.renameSync(diff, path.join(path.dirname(diff), diffFileName + '.diff' + path.extname(diff)));
        }
      });
    });

    if (tests > 0) {
      grunt.log.ok(tests + " tested image(s).");
      grunt.file.write(
        options.reportPath + '/index.html',
        grunt.template.process(
          grunt.file.read( path.dirname( __dirname ) + '/tpl/magic.tpl' ),
          { data : {
            now          : + new Date(),
            options      : options,
            templateData : images
          } }
        )
      );
    } else {
      grunt.log.warn("No tested images.");
    }
    cb(null);
  }
};