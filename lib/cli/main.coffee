module.exports = ->
  version()

version = ->
  v = (require './../../package.json').version
  console.log "soon #{v}"
