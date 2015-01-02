inject = (deps) ->
  {
    process
    console
    commands
    packageVersion
  } = deps

  cli = (args) ->
    fn = switch command = args[0]
      when '--version' then version
      else commands[command] ? unknownCommand(command)
    fn()

  unknownCommand = (command) -> ->
    console.error "soon: `#{command}` is not a soon command. See `soon --help`."
    process.exit 1

  version = ->
    console.log "soon #{packageVersion}"

  cli.inject = inject
  cli

module.exports = inject
  packageVersion: require('./../../package.json').version
  process: process
  console: console
  commands:
    completion: require './commands/completion'
    ls:         require './commands/ls'
    work:       require './commands/work'
