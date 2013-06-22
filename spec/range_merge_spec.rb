require File.dirname(__FILE__) + '/../lib/range_array'
require 'date'

describe Range do
  it "doesn't merge where there's no overlap" do
    expect((1..10).merge(20..30)).to be(nil)
  end

  it "merges identical ranges" do
    expect((1..10).merge(1..10)).to eq(1..10)
  end

  it "merges overlapping ranges" do
    expect((1..10).merge(5..20)).to eq(1..20)
  end

  it "merges out of order overlapping ranges" do
    expect((5..20).merge(1..10)).to eq(1..20)
  end

  it "merges consecutive ranges" do
    expect((1..10).merge(11..20)).to eq(1..20)
  end

  it "merges out of order consecutive ranges" do
    expect((11..20).merge(1..10)).to eq(1..20)
  end

  it "merges fully overlapping ranges" do
    expect((1..20).merge(5..15)).to eq(1..20)
  end

  it "merges fully overlapping out of order ranges" do
    expect((5..15).merge(1..20)).to eq(1..20)
  end

  it "merges date ranges" do
    r1 = (Date.parse('2013-01-01') .. Date.parse('2013-07-01'))
    r2 = (Date.parse('2013-06-01') .. Date.parse('2013-12-31'))
    r3 = (Date.parse('2013-01-01') .. Date.parse('2013-12-31'))

    expect(r1.merge(r2)).to eq(r3)
  end
end
