module To_s
  def to_s
    "#{to_s_for_cart}, #{super}"
  end
end
