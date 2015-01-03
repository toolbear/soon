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
    commands: {}
  Given -> @args = []

  When  -> @cli = require('./../lib/cli').inject @deps
  When  -> @cli(@args)

  describe 'with no arguments displays long usage', ->
    Then  -> expect(@err).to.match /^usage: soon /m
    And   -> expect(@err).to.match /^Commands:/m
    And   -> expect(@out).to.be.empty
    And   -> expect(@process.exit).to.have.been.calledWith 1

  describe 'options', ->

    describe 'with an unknown option displays short usage', ->
      Given -> @args = ['--razzledaz']

      Then  -> expect(@err).to.match /Unknown option: --razzledaz/m
      And   -> expect(@err).to.match /^usage: soon/m
      And   -> expect(@err).not.to.match /^Commands:/m
      And   -> expect(@process.exit).to.have.been.calledWith 1

    describe '--version', ->
      Given -> @deps.packageVersion = 'zulu.foxtrot.tango'
      Given -> @args = ['--version']

      Then  -> expect(@out).to.match /^soon zulu.foxtrot.tango\s$/

    describe '--help', ->
      Given -> @args = ['--help']

      Then  -> expect(@out).to.match /^usage: soon /
      And   -> expect(@err).to.be.empty
      And   -> expect(@process.exit).not.to.have.been.called

  describe 'commands', ->
    describe 'an unknown command', ->
      Given -> @args = ['snarf']

      Then  -> expect(@err).to.match /`snarf` is not a soon command./
      And   -> expect(@err).to.match /See `soon --help`/
      And   -> expect(@process.exit).to.have.been.calledWith 1

    describe 'a known command', ->
      Given -> @args = ['blort']
      Given -> @deps.commands.blort = @blort = spy()

      Then  -> expect(@blort).to.have.been.called
