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
      Given -> @args = ['--version']
      Then  -> expect(@out).to.match /^soon \d+.\d+.\d+/

  describe 'commands', ->
    Given -> @deps.commands = {}

    describe 'an unknown command', ->
      Given -> @args = ['snarf']

      Then  -> expect(@err).to.match /`snarf` is not a soon command./
      And   -> expect(@err).to.match /See `soon --help`/
      And   -> expect(@process.exit).to.have.been.calledWith 1

    describe 'a known command', ->
      Given -> @args = ['ls']
      Given -> @deps.commands.ls = @ls = spy()

      Then  -> expect(@ls).to.have.been.called
