module Tpprime
  
  # A lazy sequence of prime numbers, always starting from the first prime.
  # Realized primes are retained; although this could cause memory issues with
  # very large primes, retaining the head in this way results in very efficient
  # generation of new primes guaranteed by prime factorization theory. This is
  # reasonable because of never needing the n-th prime without prior; in such a
  # case, another method such as division-up-to-square-root or refinements would
  # be more suitable and avoid memory issues.
  class PrimeSeq
    
    include Enumerable # not all Enumerable methods will work, since infinite
    
    attr_reader :realized
    
    # Returns a new PrimeSeq. By default, no primes are realized. When +size+ is
    # specified, +size+ primes are realized in advance.
    def initialize(size = 0)
      @realized = []
      
      self.[](size - 1) if size > 0 # realize n primes
    end
    
    # Iterates through the sequence, yielding each prime. Starts with already-
    # realized primes, then continues to generate new primes. Note that this
    # method never returns, as the sequence of primes is infinite.
    def each(&block)
      @realized.each(&block)
      
      loop { yield next_prime }
    end
    
    # Returns the n-th prime, where the sequence is zero-indexed. e.g. #[0] = 2
    # Primes are realized as needed.
    def [](key)
      next_prime until @realized.length >= key + 1
      
      @realized[key]
    end
    
    private
    
    def next_prime
      realized_max = @realized.last || 1 # last == max since ordered
      
      ((realized_max + 1)...(Float::INFINITY)).each do |prime_candidate|
        unless @realized.any? { |e| prime_candidate % e == 0 }
          @realized << prime_candidate
          
          return prime_candidate
        end
      end
    end
    
  end
  
end
