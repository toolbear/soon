chai  = require 'chai'
sinon = require 'sinon'

chai.use(require 'sinon-chai')

global.expect = chai.expect
global.spy    = sinon.spy
global.stub   = sinon.stub
