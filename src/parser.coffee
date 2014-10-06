fs       = require 'fs'
{Parser} = require 'jison'
grammar  = require './grammar'

parser = new Parser grammar

module.exports = parser;
