module.exports = (fn, args...) ->
  thunk = fn.apply fn, args
  thunk = thunk() while typeof thunk == 'function'
  thunk
