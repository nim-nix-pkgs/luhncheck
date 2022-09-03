# luhncheck
Implementation of Luhn algorithm in nim.

### Usage
Install the package with `nimble`
```nim
nimble install luhncheck
```

### Example Usage
Validating a cards checksum
```nim
if validate(356938035643809):
    echo "Cards checksum appears to be valid"
```

License
----

MIT
