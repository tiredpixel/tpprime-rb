require_relative '../helper'

require_relative '../../lib/tpprime/prime_seq'


describe Tpprime::PrimeSeq do
  
  describe "#initialize" do
    it "realizes 0 elements when no size" do
      @prime_seq = Tpprime::PrimeSeq.new
      
      @prime_seq.realized.length.must_equal 0
    end
    
    it "realizes 0 elements when size = 0" do
      @prime_seq = Tpprime::PrimeSeq.new(0)
      
      @prime_seq.realized.length.must_equal 0
    end
    
    it "realizes 10 elements when size = 10" do
      @prime_seq = Tpprime::PrimeSeq.new(10)
      
      @prime_seq.realized.length.must_equal 10
    end
    
    it "realizes 0 elements when size = -1" do
      @prime_seq = Tpprime::PrimeSeq.new(-1)
      
      @prime_seq.realized.length.must_equal 0
    end
  end
  
  describe "#each" do
    before do
      @prime_seq = Tpprime::PrimeSeq.new
      
      @primes = []
      
      @prime_seq.each_with_index do |e, i|
        @primes << e
        
        break if i > 12
      end
    end
    
    it "iterates over primes" do
      @primes.must_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43]
    end
    
    it "realizes iterated primes" do
      @prime_seq.realized.must_equal @primes
    end
  end
  
  describe "#[]" do
    before do
      @prime_seq = Tpprime::PrimeSeq.new
    end
    
    it "returns 0-th prime (2)" do
      @prime_seq[0].must_equal 2
    end
    
    it "returns 42-th prime (191)" do
      @prime_seq[42].must_equal 191
    end
    
    it "realizes 10 primes when [9]" do
      @prime_seq[9]
      
      @prime_seq.realized.must_equal [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
    end
  end
  
end
