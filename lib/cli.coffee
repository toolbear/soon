inject = (deps) ->
  {
    process
    console
    commands
    packageVersion
  } = deps

  cli = (args) ->
    fn = switch arg = args[0] ? null
      when null        then helpAndFail
      when '--version' then version
      when '--help'    then help
      else
        if arg.match /^--/
          unknownOption(arg)
        else
          commands[arg] ? unknownCommand(arg)
    fn()

  unknownOption = (o) -> ->
    console.error "Unknown option: #{o}"
    usage(console.error)
    process.exit 1

  unknownCommand = (c) -> ->
    console.error "soon: `#{c}` is not a soon command. See `soon --help`."
    process.exit 1

  version = ->
    console.log "soon #{packageVersion}"

  help = (log=console.log) ->
    usage(log)
    log '''

      Commands:
        ls            List tasks polled from various sources
        work          Begin, resume, and complete tasks with a timer

        completion    Tab completion
      '''

  helpAndFail = ->
    help(console.error)
    process.exit 1

  usage = (log=console.log) ->
    log """
      usage: soon [--version] [--help] <command> [<args>]
      """

  cli.inject = inject
  cli

module.exports = inject(require './config')
