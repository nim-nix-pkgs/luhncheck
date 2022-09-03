from strutils import parseInt
from algorithm import reversed
from math import floor

proc validate*(number: int64): bool =
    let numberArray = reversed(toOpenArray($number, 0, len($number) - 1))
    var oddSum, evenSum: int
    for i in countup(0, numberArray.len() - 1):
        if i mod 2 == 0:
            oddSum += parseInt($numberArray[i])
        else:
            evenSum += toInt(floor((2 * parseInt($numberArray[i])) / 10)) + (2 * parseInt($numberArray[i]) mod 10)
    return (evenSum + oddSum) mod 10 == 0