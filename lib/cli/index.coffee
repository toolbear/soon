inject = (deps) ->
  {
    process
    console
    commands
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
    v = (require './../../package.json').version
    console.log "soon #{v}"

  cli.inject = inject
  cli

module.exports = inject
  process: process
  console: console
  commands:
    completion: require './commands/completion'
    ls:         require './commands/ls'
    work:       require './commands/work'
