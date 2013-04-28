/*global module:false*/
module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        setup: {
            bash: [
                //{ from:'from', to: 'to', type: 'dir'}
                { from:'.bash_profile', type: 'file'}
            ],
            git: [
                { from:'.gitignore_global', type: 'file'},
            ],
            vim:[
                { from:'.vim', type: 'dir' },
                { from:'.vimrc', type: 'file'}
            ]
        },
        lint: {
            grunt: ['grunt.js']
        }
    });

    // Default task.
    grunt.registerTask('default', 'setup');
    grunt.registerMultiTask('setup', 'setup my environment', function() {
        var fs = require('fs'),
        path = require('path-extra'),
        home=path.homedir() + '/';
        //home='test/';
        grunt.verbose.writeln('Processing target : ' + this.target);
        this.data.forEach( function (element, i, array) {
            grunt.verbose.writeln('Processing element : ' + element.from);
            try {
                var stat = fs.lstatSync(home + element.from);
                if ( stat.isSymbolicLink() ) {
                    grunt.verbose.writeln('Removing existing symlink : ' + element.from + ' --> ' + fs.readlinkSync(home + element.from));
                    fs.unlinkSync(home + element.from);
                } else if ( stat.isFile() ) {
                    grunt.verbose.writeln('removing existing file : ' + element.from);
                    fs.unlinkSync(home + element.from);
                } else {

                }
            } catch(e) {
                grunt.verbose.writeln('No existing symlink : ' + element.from);
            }
            fs.symlinkSync(fs.realpathSync('lib/' + grunt.task.current.target) + '/' + element.from, home + element.from, element.type);
            grunt.log.writeln('Symlink created : ' + element.from + ' --> ' + fs.readlinkSync(home + element.from));
        });
    });
};
