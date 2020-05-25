module FizzBuzzMultipleDispatch

export fizzbuzz

# Define traits

abstract type Divisibility end

struct IsDivBy3 <: Divisibility end
struct NotDivBy3 <: Divisibility end

struct IsDivBy5 <: Divisibility end
struct NotDivBy5 <: Divisibility end

# Determine divisibility traits

div3trait(x) = x % 3 == 0 ? IsDivBy3() : NotDivBy3()
div5trait(x) = x % 5 == 0 ? IsDivBy5() : NotDivBy5()

# Dispatch

fizzbuzz(x) = fizzbuzz(div3trait(x), div5trait(x), x)

fizzbuzz(::IsDivBy3, ::NotDivBy5, x)  = "Fizz"
fizzbuzz(::NotDivBy3, ::IsDivBy5, x)  = "Buzz"
fizzbuzz(::IsDivBy3, ::IsDivBy5, x)   = "FizzBuzz"
fizzbuzz(::NotDivBy3, ::NotDivBy5, x) = string(x)

end
