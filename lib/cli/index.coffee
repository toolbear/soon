inject = (deps) ->
  {
    process
    console
    commands
  } = deps

  cli = (args) ->
    fn = switch command = args[0]
      when '--version' then version
      when 'completion' then require './commands/completion'
      when 'ls' then commands.ls
      when 'work' then require './commands/work'
      else ->
        console.error "soon: `#{command}` is not a soon command. See `soon --help`."
        process.exit 1
    fn()

  version = ->
    v = (require './../../package.json').version
    console.log "soon #{v}"

  cli.inject = inject
  cli

module.exports = inject(
  process: process
  console: console
  commands:
    ls: require './commands/ls'
)
