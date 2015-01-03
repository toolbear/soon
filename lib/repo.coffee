which = require 'which'
exec = require('child_process').execFile

module.exports = (cb = ->) ->
  git = which.sync 'git'
  cwd = process.cwd()
  exec(git, ['rev-parse', '--show-toplevel'], {cwd: cwd}, (err, stdout, stderr) ->
    return (console.log "doesn't look like you're in a git repo"; cb(err)) if err
    cb(null, stdout.trim(), null)
  )
  return
