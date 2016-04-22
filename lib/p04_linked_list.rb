class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  attr_accessor :head, :last

    include Enumerable
  def initialize
    @head = Link.new
    @last = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @last
  end

  def empty?
    @head.next.nil?
  end

  def get(key1)
    self.each do |link|
      return link.val if link.key == key1
    end
  end

  def include?(key)
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    # if list is empty
    if @head.prev.nil?
      # Insert the first element and call it "head"
      @head.prev = new_link
      @head.next = @last#
      @last.prev = @head
      @head = new_link
    else
      @head.prev = new_link
      new_link.next = @head
      @head = new_link

    end
    # last.next = item
    # item.prev = last
  end

  def remove(key)

  end

  def each(&prc)
    current = @last
    while true
      prc.call(current) if block_given?
      return if current.next == nil
      current = current.next
    end
    # current
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
