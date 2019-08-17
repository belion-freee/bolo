class String
  def integer?
    self.match?(/^\d+$/)
  end
end
