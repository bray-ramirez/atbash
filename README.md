# atbash
Atbash decoder

## Problem
CONSTANT       = 'abcdefghijklmnopqrstuvwxyz'

cipher         = 'oephjizkxdawubnytvfglqsrcm'

encrypted text = 'knlfgnb, sj koqj o yvnewju'

original text  = ?

## Solution
```ruby
Atbash.new('oephjizkxdawubnytvfglqsrcm').decode('knlfgnb, sj koqj o yvnewju')
# Answer: "houston, we have a problem"
```
