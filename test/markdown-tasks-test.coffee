lex = require('marked').lexer

describe '#markdownTasks(doc)', ->

  Given -> @lexer
  Given -> @doc

  When  -> @deps =
    lexMarkdown: => @lexer
  When  -> @subject = require('./../lib/markdown-tasks').inject @deps
  When  -> @tasks = @subject @doc

  describe 'lexes the requested doc', ->
    Given -> @lexer = stub().returns []
    Given -> @doc = 'Just starting'

    Then  -> (expect @lexer).is.calledWith @doc

  describe 'when doc has', ->
    Given -> @lexer = lex

    Invariant -> (expect @tasks).is.an 'array'

    describe 'no tasks because', ->
      Invariant -> (expect @tasks).is.empty

      describe 'it is empty', ->
        Given -> @doc = ''
        Then  ->

      describe 'it only has a regular list', ->
        Given -> @doc = '* bullet time'
        Then  ->

      describe 'it only has a malformed task #1', ->
        Given -> @doc = '* [ ]'
        Then  ->

      describe 'it only has a malformed task #2', ->
        Given -> @doc = '* [ ]invade personal space'
        Then  ->

      describe 'it only has a malformed task #3', ->
        Given -> @doc = '* [] get fat'
        Then  ->

      describe 'we ignore nested lists for now', ->
        Given -> @doc = '''
          * birdie
            * [ ] leave the nest
          '''
        Then  ->

    describe 'one task marked', ->
      Given     -> @text = 'just do it'

      Invariant -> (expect @tasks).has.length 1
      Invariant -> @tasks[0].text is @text

      describe 'incomplete', ->
        Given -> @doc = "* [ ] #{@text}"
        Then  -> @tasks[0].completed is false
        And   -> @tasks[0].text is 'just do it'

      describe 'complete #1', ->
        Given -> @doc = "* [x] #{@text}"
        Then  -> @tasks[0].completed is true

      describe 'complete #2', ->
        Given -> @doc = "* [v] #{@text}"
        Then  -> @tasks[0].completed is true

    describe 'multiple tasks in a single list', ->
      Given -> @doc = '''
        * [ ] Guard! Turn! Parry! Dodge! Spin!
        * [ ] Ha!
        * [ ] Thrust!
        '''
      Then  -> expect(@tasks).has.length 3

    describe 'multiple lists with tasks', ->
      Given -> @doc = '''
        ## Redesign

        * [ ] trash it
        * [ ] change it

        ## Come to our senses

        * [ ] mail - upgrade it
        '''
      Then -> expect(@tasks).has.length 3

    xdescribe 'test these cases', ->
      Given -> @doc = '''
        ## Nested 2

        * [ ] depth=1 #1
          * [ ] depth=2
            * [ ] depth=3
        * [ ] depth=1 #2

        ## "Loose"

        * [ ] loose 1

        * [ ] loose 2

        * [ ] loose 3

        ## Prose

        * [ ] I like turtles

          Timmah!
        '''
