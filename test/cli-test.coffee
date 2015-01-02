require './support/spec-helper'

describe '$ soon', ->

  Given -> [@out, @err] = ['', '']
  Given -> @process = { exit: spy() }
  Given -> @console =
    log:   (m) => @out += "#{m}\n"
    error: (m) => @err += "#{m}\n"

  When  -> @cli = require('./../lib/cli').inject({
    process: @process
    console: @console
  })
  When  -> @cli(@args)

  describe 'an unknown command', ->
    Given -> @args = ['snarf']
    Then  -> expect(@err).to.match /^unknown command: snarf/
    And   -> expect(@process.exit).to.have.been.calledWith 1

  describe '--version', ->
    Given -> @args = ['--version']
    Then  -> expect(@out).to.match /^soon \d+.\d+.\d+/
