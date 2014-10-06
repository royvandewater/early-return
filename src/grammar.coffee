grammar =
  lex:
    rules: [
      ['\\s+',                    '/* skip whitespace */']
      ['[0-9]+(?:\\.[0-9]+)?\\b', 'return "NUMBER";']
      ['\\+',                     'return "+";']
      ['-',                       'return "-";']
      ['\\*',                     'return "*";']
      ['\\/',                     'return "/";']
      ['$',                       'return "EOF";']
    ]
  operators: [
    ['left', '+', '-', '*', '/']
  ]
  bnf:
    expressions: [
      ['e EOF',   'return $1;']
    ]
    e: [
      ['e + e',  '$$ = $1 + " + " + $3;']
      ['e - e',  '$$ = $1 + " - " + $3;']
      ['e * e',  '$$ = $1 + " * " + $3;']
      ['e / e',  '$$ = $1 + " / " + $3;']
      ['NUMBER', '$$ = $1']
    ]

module.exports = grammar
