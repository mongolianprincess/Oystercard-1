Answers to interview questions #05
==================================
When do you have to use a return statement in Ruby and when can you omit it?
----------------------------------------------------------------------------
You can omit it if you want your method to run to the last line of code in that method, since it will return the result of this line by default.

What are instance variables and how they are different from local variables?
----------------------------------------------------------------------------
Difference is in their scope. Local variables only exist within the block they are defined in, whereas instance variables exist for as long as the class they are defined in does.

How can you access instance variable outside the instance they belong to?
-------------------------------------------------------------------------
With a getter method (defined explicitly or with attr_reader).

What is the red/green/refactor cycle? Give me an example of using it.
---------------------------------------------------------------------
Red: create a unit test that fails<br>
Green: write production code that makes that test pass<br>
Refactor: clean up the code, make it pretty<br>
