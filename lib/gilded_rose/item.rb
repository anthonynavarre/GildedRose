class Item
  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50

  attr_accessor :name, :sell_in, :quality
        
  def initialize (name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def expired?
    @sell_in < 0
  end

  def age
    @sell_in = @sell_in - 1
  end

end
