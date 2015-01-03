inject = (deps) ->
  {
    process
    console
    commands
    packageVersion
  } = deps

  cli = (args) ->
    fn = switch c = args[0] ? null
      when null then usage
      when '--version' then version
      when '--help' then help
      else commands[c] ? unknownCommand(c)
    fn()

  unknownCommand = (command) -> ->
    console.error "soon: `#{command}` is not a soon command. See `soon --help`."
    process.exit 1

  version = ->
    console.log "soon #{packageVersion}"

  help = (log=console.log) ->
    log '''
      usage: soon [--version] [--help] <command> [<args>]

      Commands:
        ls            List tasks polled from various sources
        work          Begin, resume, and complete tasks with a timer
      '''

  usage = ->
    help console.error
    process.exit 1

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
