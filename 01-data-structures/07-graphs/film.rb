class Film
  attr_accessor :from
  attr_accessor :to
  attr_accessor :title

  def initialize(from, to, title)
    @from = from
    @to = to
    @title = title
  end

  def <=>(other)
    self.title = other.title
  end

  def to_s
    "#{from.to_s} starred in '#{title}' with #{to.to_s}"
  end
end
