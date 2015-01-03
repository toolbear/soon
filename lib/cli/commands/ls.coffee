fs     = require 'fs'
marked = require 'marked'
repo   = require './../../repo'
glob   = require 'glob'

module.exports = (cb) ->
  repo (err, workdir) ->
    return if err

    glob 'README.{md,markdown}', cwd: workdir, (err, files) ->
      [ readme ] = files
      tokens = new marked.Lexer().lex(fs.readFileSync readme, encoding: 'utf8')

      level = 0
      collect = false
      tasks = []
      for token, i in tokens
        switch token.type
          when 'list_start' then ++level
          when 'list_end' then --level
          when 'list_item_start' then collect = level == 1
          when 'list_item_end' then collect = false
          when 'text'
            if collect
              [match, ballot, text] = (token.text.match /^(\[.\]) (.+)$/) ? []
              if match
                t = switch ballot
                  when '[ ]'       then { text: text, completed: false }
                  when '[x]','[v]' then { text: text, completed: true }
                tasks.push t if t
      console.log tasks
