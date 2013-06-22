class Range
  def merge(r)
    return self if self == r

    return self if fully_overlaps?(r)
    return r if fully_overlapped_by?(r)

    return (r.min .. self.max) if adjoins?(r) || start_overlapped_by?(r)
    return (self.min .. r.max) if adjoined_by?(r) || end_overlapped_by?(r)

    self
  end

  private

  def fully_overlaps?(r)
    start_overlapped_by?(r) && end_overlapped_by?(r)
  end

  def fully_overlapped_by?(r)
    r.cover?(self.min) && r.cover?(self.max)
  end

  def start_overlapped_by?(r)
    self.cover?(r.max)
  end

  def end_overlapped_by?(r)
    self.cover?(r.min)
  end

  def adjoins?(r)
    r.max.succ == self.min    
  end

  def adjoined_by?(r)
    self.max.succ == r.min
  end
end
