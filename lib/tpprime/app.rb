require 'matrix'


module Tpprime
  
  # An application, such as can be utilised within an executable.
  class App
    
    attr_reader :config
    
    # Returns a new App. By default, the smallest +size+ is set. An App can be
    # configured by passing options, which are merged onto defaults.
    def initialize(opts = {})
      @config = {
        :size => 1,
      }.merge(opts)
    end
    
    # Returns a multiplication grid suitable for display. This has a header row
    # and a header column, with cells spaced nicely.
    def grid
      grid = mult_matrix
      
      max_cell_length = grid[-1, -1].to_s.length # max by construction
      
      grid.to_a.map do |row|
        row.map do |cell|
          "%#{max_cell_length}s" % (cell == 1 ? nil : cell) # format, ignoring 1
        end.join(" ")
      end.join($/)
    end
    
    private
    
    def mult_matrix
      primes = PrimeSeq.new(@config[:size]).realized
      
      vector = Matrix[[1] + primes] # prepend 1 for headers
      
      vector.transpose * vector
    end
    
  end
  
end
