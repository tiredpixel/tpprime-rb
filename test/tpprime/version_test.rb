require_relative '../helper'


describe "Tpprime::VERSION" do
  
  it "uses major.minor.patch" do
    Tpprime::VERSION.must_match /\A\d+\.\d+\.\d+\z/
  end
  
end
