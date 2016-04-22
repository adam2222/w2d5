class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |num, idx|
      # if num.is_a?(Array)
        product = (num.hash * idx)
        sum += product
      # else
      # product = (num * idx)
      # sum += product
      # end
    end

    sum.hash
  end
end

class String
  def hash
    letters = self.chars
    letters.map! { |char| char.ord }.hash
  end
end

class Hash
  def hash
    keys = self.keys.map { |key| key.to_s }.sort!
    values = self.values.sort!
    keys.concat(values)
    keys.join("").hash
  end
end
