fs     = require 'fs'
glob   = require 'glob'
repo   = require './../../repo'
tasks  = require './../../markdown-tasks'

module.exports = (cb) ->
  repo (err, workdir) ->
    return if err

    glob 'README.{md,markdown}', cwd: workdir, (err, files) ->
      [ readme ] = files
      _tasks = tasks(fs.readFileSync readme, encoding: 'utf8')
      (console.log "✓ #{t.text}" unless t.completed) for t in _tasks
