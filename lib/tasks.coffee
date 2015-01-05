config = require './config'

inject = (deps) ->
  {} = deps

  tasks = ->
    [{ text: 'badoop', completed: false }]

  tasks.inject = inject
  tasks

module.exports = inject config
