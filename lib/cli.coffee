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
      when '--help' then help
      else commands[command] ? unknownCommand(command)
    fn()

  unknownCommand = (command) -> ->
    console.error "soon: `#{command}` is not a soon command. See `soon --help`."
    process.exit 1

  version = ->
    console.log "soon #{packageVersion}"

  help = ->
    console.log '''
      usage: soon [--version] [--help] <command> [<args>]

      Commands:
        ls            List tasks polled from various sources
        interactive   REPL and tty notifications
        work          Begin, resume, and complete tasks with a timer
      '''

  cli.inject = inject
  cli

module.exports = inject
  packageVersion: require('./../package.json').version
  process: process
  console: console
  commands:
    completion: require './cli/commands/completion'
    ls:         require './cli/commands/ls'
    work:       require './cli/commands/work'
