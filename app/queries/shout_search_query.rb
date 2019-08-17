# Matt prefer's that even models not know much about SQL
# If you have to dip into raw SQL, then separate out a query object to handle it

class ShoutSearchQuery
  def initialize(term)
    @term = term
  end

  # Just a convention to name the thing that does the query "to_relation"
  def to_relation
    Shout
      .joins("LEFT JOIN text_shouts ON content_type = 'TextShout' and content_id = text_shouts.id")
      .where('text_shouts.body LIKE ?', "%#{term}%")
  end

  private
  attr_reader :term
end
