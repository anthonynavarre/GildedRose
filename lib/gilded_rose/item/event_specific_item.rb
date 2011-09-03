class EventSpecificItem < Item

  def age
    super
    if expired?
      @quality = 0
    else
      appreciate
    end
  end

  private

  def appreciate
    unless @quality >= MAXIMUM_QUALITY
      @quality = @quality + appreciation_amount
    end
    @quality
  end

  def appreciation_amount
    case
    when @sell_in < 6 then 3
    when @sell_in < 11 then 2
    else
      1
    end
  end

end

