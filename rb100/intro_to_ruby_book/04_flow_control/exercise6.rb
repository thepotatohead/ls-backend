# Write down whether the following expressions return `true` or `false`
# or raise an error. Then, type the expressions into irb to see the
# results.

(32 * 4) >= "129" # => false WRONG!
# raises an error:
# `>': comparison of Integer with String failed (ArgumentError)
847 == '847'      # => false
'847' < '846'     # => false
'847' > '846'     # => true
'847' > '8478'    # => false
'847' < '8478'    # => true

