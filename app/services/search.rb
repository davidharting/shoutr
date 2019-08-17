class Search
  def initialize(term)
    @term = term
  end

  # Convention to have a service have one method to do the thing it does
  def run
    ShoutSearchQuery.new(term).to_relation
  end

  private
  attr_reader :term
end
