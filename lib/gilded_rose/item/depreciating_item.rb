class DepreciatingItem < Item

  def age
    depreciate
    super
  end

  private

  def depreciate
    unless @quality <= MINIMUM_QUALITY
      amount = (@sell_in < 0) ? 2 : 1
      @quality = @quality - amount
    end
  end

end

