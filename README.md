early-return
============

A Language without IFs

Methods
-------

* Every method takes exactly one argument (must be an object)
* Every method 'returns' by firing an event
* All methods listen on one or more events
* Methods cannot call other methods
* Methods have no if confitionals
* Methods can use 'clauses' to early-return (preventing their registered event from firing)
* Supports implicit return

Statements
----------

* Takes exactly one argument (must be an object)
* May only be used at the top of a method (In the 'when' section)
* May only return a boolean
* Must be synchronous
* Supports implicit return


Example
-------

class Product
  # Register events that will trigger this event
  @on 'change:price', 'change:quantity'
  method calculate_total_price(arg) => 'new_total_price' # register event to fire on return
    when is_positive(number: arg.price)    # Guard clause, halts execution unless it returns true
    when is_positive(number: arg.quantity) # early returns from guard clauses do not fire the event

    total_price = arg.price * arg.quantity # Create local variable, scoped to method
    total_price: total_price # Fires 'new_total_price' with the object {total_price: total_price}

  # Register events
  @on 'new_total_price' # Will happen after calculate_total_price, or anything else that fires new_total_price
  method set_total_price => 'change:total_price' # Argument name is optional, defaults to arg
    when is_positive number: arg.total_price # Parens are optional
    when is_correct_total_price arg # Expects {total_price: number}

    @total_price = arg.total_price # Set local instance variable
    total_price: @total_price # Fire 'change:total_price' with {total_price: @total_price}

  clause is_positive
    arg.number > 0 # return value is coerced into a boolean

  clause is_correct_total_price
    arg.total_price == arg.price * arg.quantity
