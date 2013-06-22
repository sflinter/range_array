require File.dirname(__FILE__) + '/../lib/range_array'

require 'date'

describe RangeArray do
  it "can create a new RangeArray" do
    ra = RangeArray.new
    expect(ra.class).to eq(RangeArray)
  end

  it "can add new items" do
    ra = RangeArray.new
    ra << (1..2)
    expect(ra.size).to eq(1)
  end

  it "can add two items" do
    ra = RangeArray.new
    ra << (1..10)
    ra << (20..30)
    expect(ra.size).to eq(2)
    expect(ra.first).to eq(1..10)
    expect(ra.last).to eq(20..30)
  end

  it "won't add non-range items" do
    ra = RangeArray.new
    ra << (1..2)
    ra << 4
    expect(ra.size).to eq(1)
  end

  it "can append non-consecutive intervals" do
    ra = RangeArray.new
    ra << (1..5)
    ra << (10..20)
    expect(ra.size).to eq(2)
  end

  it "can append consecutive intervals" do
    ra = RangeArray.new
    ra << (1..2)
    ra << (3..4)
    expect(ra.size).to eq(1)
    expect(ra.first).to eq(1..4)
  end

  it "can append consecutive intervals in reverse order" do
    ra = RangeArray.new
    ra << (3..4)
    ra << (1..2)
    expect(ra.size).to eq(1)
    expect(ra.first).to eq(1..4)
  end

  it "can add simple overlapping intervals" do
    ra = RangeArray.new
    ra << (1..5)
    ra << (4..10)
    expect(ra.size).to eq(1)
    expect(ra.first).to eq(1..10)
  end

  it "can add simple overlapping intervals in reverse order" do
    ra = RangeArray.new
    ra << (4..10)
    ra << (1..5)
    expect(ra.size).to eq(1)
    expect(ra.first).to eq(1..10)
  end

  it "can add identical ranges without duplication" do
    ra = RangeArray.new
    ra << (1..10)
    ra << (1..10)
    expect(ra.size).to eq(1)
  end

  it "can join multiple intervals" do
    ra = RangeArray.new
    ra << (1..4)
    ra << (8..10)
    ra << (5..7)
    expect(ra.size).to eq(1)
    expect(ra.first).to eq(1..10)
  end

  it "can join overlapping intervals" do
    ra = RangeArray.new
    ra << (1..4)
    ra << (6..10)
    ra << (3..8)
    expect(ra.size).to eq(1)
    expect(ra.first).to eq(1..10)
  end

  it "can join overlapping date intervals" do
    ra = RangeArray.new
    ra << (Date.parse('2013-01-01') .. Date.parse('2013-05-01'))
    ra << (Date.parse('2013-10-01') .. Date.parse('2013-12-31'))
    expect(ra.size).to eq(2)

    ra << (Date.parse('2013-04-01') .. Date.parse('2013-11-01'))
    expect(ra.size).to eq(1)
    expect(ra.first).to eq(Date.parse('2013-01-01') .. Date.parse('2013-12-31'))
  end
end
