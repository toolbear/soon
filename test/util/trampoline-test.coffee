describe '#trampoline(fn, args...)', ->

  When  -> @subject = require './../../lib/util/trampoline'

  describe "calling #fn", ->
    Given -> @spy = spy()

    describe "without args", ->
      When  -> @subject @spy
      Then  -> expect(@spy).to.have.been.calledWith()

    describe "with args", ->
      When  -> @subject @spy, 1, 2, 3
      Then  -> expect(@spy).to.have.been.calledWith 1, 2, 3

  describe "fn() returns", ->
    Given -> @stub = stub()
    When  -> @result = @subject @stub

    describe "the final result", ->
      Given -> @stub.returns 42
      Then  -> @result is 42

    describe "a thunk that returns the final result", ->
      Given -> @thunk = stub().returns 'brilliant'
      Given -> @stub.returns @thunk

      Then  -> @result is 'brilliant'
