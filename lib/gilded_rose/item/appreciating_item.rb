class AppreciatingItem < Item

  def age
    appreciate
    super
  end

  private

  def appreciate
    unless @quality >= MAXIMUM_QUALITY
      @quality = @quality + 1
    end
    @quality
  end

end

