config = require('./../../config')

inject = (deps) ->
  {
    console
    tasks
  } = deps

  ls = ->
    (console().log "✓ #{t.text}" unless t.completed) for t in tasks()()

  ls.inject ?= inject
  ls

module.exports = inject config
