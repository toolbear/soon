config = require './config'
trampoline = require './util/trampoline'

inject = (deps) ->
  {
    lexMarkdown
  } = deps

  markdownTasks = (doc) -> trampoline parseTokens, lexMarkdown()(doc)

  parseTokens = (tokens, i=0, tasks=[], state={list_depth: 0, capture: false}) ->
    return tasks unless i < tokens.length
    parseToken tokens[i], tasks, state
    -> parseTokens tokens, i+1, tasks, state

  parseToken = (token, tasks, state) ->
    switch token.type
      when 'list_start'
        ++state.list_depth
      when 'list_end'
        --state.list_depth
      when 'list_item_start', 'loose_item_start'
        state.capture = state.list_depth == 1
      when 'list_item_end'
        state.capture = false
      when 'text'
        if state.capture
          task = parseTask token.text
          tasks.push task if task

  parseTask = (candidate) ->
    [match, ballot, text] = candidate.match(/^(\[.\]) (.+)$/) ? []
    switch ballot
      when '[ ]'       then { text: text, completed: false }
      when '[x]','[v]' then { text: text, completed: true }

  markdownTasks

module.exports = inject config
module.exports.inject = inject
