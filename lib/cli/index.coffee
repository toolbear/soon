module.exports = ->
  command = switch process.argv[2]
    when '--version' then version
    when 'completion' then require './commands/completion'
    when 'ls' then require './commands/ls'
    when 'work' then require './commands/work'
    else ->
      console.error 'oops'
      process.exit 1
  command()

version = ->
  v = (require './../../package.json').version
  console.log "soon #{v}"
