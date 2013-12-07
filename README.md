# Tpprime

Tpprime is a simple command-line program for displaying multiplication grids of
prime numbers. Primes are generated using a lazy sequence with a flexible API,
which realizes elements utilising a retained head. New primes are guaranteed
using prime factorization theory, rather than using division-up-to-square-root
or refined methods. Although the implemented approach could cause memory issues
with very large primes, it is very efficient for generating a fixed sequence.

More sleep lost by [tiredpixel](http://www.tiredpixel.com).


## Example

    $ tpprime -s 10

          2   3   5   7  11  13  17  19  23  29
      2   4   6  10  14  22  26  34  38  46  58
      3   6   9  15  21  33  39  51  57  69  87
      5  10  15  25  35  55  65  85  95 115 145
      7  14  21  35  49  77  91 119 133 161 203
     11  22  33  55  77 121 143 187 209 253 319
     13  26  39  65  91 143 169 221 247 299 377
     17  34  51  85 119 187 221 289 323 391 493
     19  38  57  95 133 209 247 323 361 437 551
     23  46  69 115 161 253 299 391 437 529 667
     29  58  87 145 203 319 377 493 551 667 841


## Installation

Install using:

    $ gem build tpprime.gemspec
    $ gem install --local tpprime-*.gem

or run `bin/tpprime` directly without installation.


## Usage

View the available options:

    $ tpprime --help

Display a 10 x 10 multiplication grid of primes:

    $ tpprime -s 10


## PrimeSeq lazy sequence of primes

Require the `PrimeSeq`:

    require './lib/tpprime/prime_seq'

Create a new lazy sequence, iterating over first 100 primes, and inspecting
realized elements:

    pseq = Tpprime::PrimeSeq.new
    pseq.each_with_index { |e, i| puts e; break if i >= 9 }
    p pseq.realized

Create a new lazy sequence with 100 primes realized:

    pseq = Tpprime::PrimeSeq.new(100)
    p pseq.realized

Display the 1000-th prime:

    puts Tpprime::PrimeSeq.new[999] # zero-indexed
