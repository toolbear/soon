describe '$ soon ls', ->

  Given -> [@out, @err] = ['', '']
  Given -> @line = 0
  Given -> @console =
    log:   (m) => @out += "line-#{++@line}: #{m}\n"
    error: (m) => @err += "line-#{++@line}: #{m}\n"
  Given -> @tasks = stub()
  Given -> @deps =
    console: => @console
    tasks:   => @tasks

  When -> @subject = require('./../../../lib/cli/commands/ls').inject @deps
  When -> @subject()

  describe 'incomplete task', ->
    Given -> @tasks.returns [{ completed: false, text: "party like it's 1999" }]
    Then  -> expect(@out).to.match /^line-1: ✓ party like it's 1999$/m
