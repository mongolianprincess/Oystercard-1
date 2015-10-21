Answers to interview questions #03
==================================
Explain what a stack trace is.
------------------------------
A stack trace is a report on the active frames used during the execution of a
program. Each time a function is called in the program, a block of memory is
allocated on top of the stack. A trace allows tracking the sequence of nested
functions called, up to the point where the trace is generated (on a failure
  for example).
