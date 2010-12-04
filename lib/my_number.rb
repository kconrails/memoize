class MyNumber
  extend ActiveSupport::Memoizable
  
  attr_accessor :x
  
  def initialize(x)
    @x = x
  end
  
  def plus(y)
    @x + y
  end
  memoize :plus
end