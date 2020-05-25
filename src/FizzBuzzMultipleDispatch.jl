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

fizzbuzz(::T, ::S, x) where {T <: IsDivBy3,  S <: IsDivBy5}  = "FizzBuzz"
fizzbuzz(::T, ::S, x) where {T <: IsDivBy3,  S <: NotDivBy5} = "Fizz"
fizzbuzz(::T, ::S, x) where {T <: NotDivBy3, S <: IsDivBy5}  = "Buzz"
fizzbuzz(::T, ::S, x) where {T <: NotDivBy3, S <: NotDivBy5} = string(x)

end
