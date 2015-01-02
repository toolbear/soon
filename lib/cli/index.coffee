inject = (deps) ->
  {process, console} = deps

  cli = (args) ->
    fn = switch command = args[0]
      when '--version' then version
      when 'completion' then require './commands/completion'
      when 'ls' then require './commands/ls'
      when 'work' then require './commands/work'
      else ->
        console.error "unknown command: #{command}" 
        process.exit 1
    fn()

  version = ->
    v = (require './../../package.json').version
    console.log "soon #{v}"

  cli.inject = inject
  cli

module.exports = inject({ process: process, console: console })
