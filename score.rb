require 'csv'
require "fileutils"
require "tempfile"

class Score
  VALUES = {
    a: 1,
    b: 3,
    c: 3,
    d: 2,
    e: 1,
    f: 4,
    g: 2,
    h: 4,
    i: 1,
    j: 8,
    k: 5,
    l: 1,
    m: 3,
    n: 1,
    o: 1,
    p: 3,
    q: 10,
    r: 1,
    s: 1,
    t: 1,
    u: 1,
    v: 4,
    w: 4,
    x: 8,
    y: 4,
    z: 10
  }

  def self.score(str)
    str.strip.split('').inject(0) do |sum, word|
      sum += (VALUES[word.to_sym]).to_i
    end
  end

  def self.compute(filename)
    temp = Tempfile.new("csv")

    CSV.open(temp, "w") do |temp_csv|
      CSV.foreach(filename) do |orig|
        result = self.score(orig[0])
        temp_csv << orig + [result]
      end
    end

    FileUtils.mv(temp, filename, :force => true)
  end

end

Score.compute(ARGV[0])
