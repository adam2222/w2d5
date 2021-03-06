require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @store[key.hash % num_buckets] << key
    @count += 1
    resize! if count == num_buckets
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    @store[key.hash % num_buckets].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = num_buckets * 2
    new_array = Array.new(new_num_buckets) { Array.new }

    @store.each do |array|
      array.each do |key|
        new_bucket = key.hash % new_num_buckets
        new_array[new_bucket] << key
      end
    end

    @store = new_array
  end
end
