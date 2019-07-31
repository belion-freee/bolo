class Array
  def merge
    case self.first
    when Array
      self.to_h
    when Hash
      self.inject(:merge)
    else
      self
    end
  end
end
