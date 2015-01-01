require './support/spec-helper'

describe '$ soon', ->

  Given -> [@out, @err] = ['', '']
  Given -> @process = { exit: -> }
  Given -> @console =
    log:   (m) => @out += m
    error: (m) => @err += m

  When  -> @cli = require('./../lib/cli').inject({
    process: @process
    console: @console
  })
  When  -> @cli(@args)

  describe '--version', ->
    Given -> @args = ['--version']
    Then  -> expect(@out).to.match /^soon \d+.\d+.\d+/
