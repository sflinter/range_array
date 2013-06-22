class RangeArray < Array
  alias append <<

  def <<(range)
    return unless range.class == Range
    super eliminate_overlaps(merged_range(range))
  end

  private

  def merged_range(range)
    self.inject(range) do |memo_range, r|
      memo_range.merge!(r)
    end
  end

  def eliminate_overlaps(range)
    self.delete_if do |r|
      r.merge(range)
    end
    range
  end
end
