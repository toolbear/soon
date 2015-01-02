require './support/spec-helper'

describe '$ soon', ->

  Given -> [@out, @err] = ['', '']
  Given -> @process = { exit: spy() }
  Given -> @console =
    log:   (m) => @out += "#{m}\n"
    error: (m) => @err += "#{m}\n"
  Given -> @deps =
    process: @process
    console: @console

  When  -> @cli = require('./../lib/cli').inject @deps
  When  -> @cli(@args)

  describe 'options', ->

    describe '--version', ->
      Given -> @deps.packageVersion = 'zulu.foxtrot.tango'
      Given -> @args = ['--version']

      Then  -> expect(@out).to.match /^soon zulu.foxtrot.tango\s$/

  describe 'commands', ->
    Given -> @deps.commands = {}

    describe 'an unknown command', ->
      Given -> @args = ['snarf']

      Then  -> expect(@err).to.match /`snarf` is not a soon command./
      And   -> expect(@err).to.match /See `soon --help`/
      And   -> expect(@process.exit).to.have.been.calledWith 1

    describe 'a known command', ->
      Given -> @args = ['blort']
      Given -> @deps.commands.blort = @blort = spy()

      Then  -> expect(@blort).to.have.been.called
