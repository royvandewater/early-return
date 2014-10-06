parser = require '../../src/parser'

describe 'Grammar', ->
  describe 'numbers', ->
    it 'should recognize integers', ->
      result = parser.parse '3'
      expect(result).to.equal 3

    it 'should recognize integers', ->
      result = parser.parse '5'
      expect(result).to.equal 5

    it 'should recognize decimal numbers', ->
      result = parser.parse '5.5'
      expect(result).to.equal 5.5

  describe 'addition', ->

  it 'should add 3 + 2', ->
    result = parser.parse '3+2'
    expect(result).to.equal 5

  it 'should ignore whitespace', ->
    result = parser.parse '3 + 2 +  5'
    expect(result).to.equal 10
