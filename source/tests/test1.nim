import unittest
import luhncheck

test "can validate card checksums":
    check validate(356938035643809) == true
    check validate(534618613411236) == false
