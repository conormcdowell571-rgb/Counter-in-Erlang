-module(counter).
-export([main/0]).
-export([fibonacci/3]).
-export([factorialCounter/3]).
-export([doubling/2]).

main() ->
    io:format("Welcome to the erlang counter program!~n"),
    functionChooser().

functionChooser() ->
    %Get the user's decision of what they want to do
    io:format("What would you like to do?~n"),
    Chooser = io:get_line("1. Fibonacci 2. Factorial 3. Doubling: "),
    ChooserTrimmed = string:trim(Chooser),

    %Get the number the user wants to count to, or the desired factorial
    BigNumString = io:get_line("Enter the largest number you want to count to (or factorial starting term): "),
    BigNumStringTrimmed = string:trim(BigNumString),

    %Make sure the number is formatted correctly and convert it into an integer 
    case string:to_integer(BigNumStringTrimmed) of
        {BigNum, []} ->
            io:format("Good ~n"),
            BigNum;
        {_, _} ->
            io:format("Bad ~n"),
            BigNum = 0,
            error 
    end,
    
    %Call different functions based on user input
    case ChooserTrimmed of
        "1" ->
            fibonacci(BigNum, 1, 0);
        "2" ->
            factorialCounter(BigNum, BigNum - 1, 1);
        "3" ->
            doubling(BigNum, 1);
        _ ->
            io:format("Please enter 1, 2, or 3."),
            main()
    end.

%Receive a value, BigNum, and print a list of integers from 0 to the value just below BigNum in a fibonacci sequence
fibonacci(BigNum, NextNum, SmallNum) when BigNum >= SmallNum ->
    io:format("~p ~n", [SmallNum]),
    NewNum = NextNum + SmallNum,
    fibonacci(BigNum, NewNum, NextNum).

%Print the factorial of a value, BigNum
factorialCounter(BigNum, NextNum, SmallNum) when NextNum >= SmallNum ->
    NewNum = BigNum * NextNum,
    io:format("~p ~n", [BigNum]),
    factorialCounter(NewNum, NextNum - 1, SmallNum).

%Print a doubling sequence from 1 to the value BigNum
doubling(BigNum, SmallNum) when BigNum >= SmallNum ->
    io:format("~p ~n", [SmallNum]),
    NewNum = SmallNum + SmallNum,
    doubling(BigNum, NewNum).
    



