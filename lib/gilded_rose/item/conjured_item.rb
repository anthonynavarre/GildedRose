class ConjuredItem < Item

  def age
    super
    @quality = @quality - 2
  end

end

