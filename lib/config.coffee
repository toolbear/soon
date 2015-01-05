module.exports =
  packageVersion: -> require('./../package.json').version
  process:        -> process
  console:        -> console

  commands: ->
    completion: require './cli/commands/completion'
    ls:         require './cli/commands/ls'
    work:       require './cli/commands/work'

  tasks:          -> require './tasks'
