class Hashtag
  def initialize(tag)
    @tag = tag
  end

  attr_reader :tag

  def shouts
    Search.new("##{tag}").run
  end
end
