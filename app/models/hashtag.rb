class Hashtag
  def initialize(tag)
    @tag = tag
  end

  attr_reader :tag

  def shouts
    # TODO: Safely parameterize
    # TODO: Query through shout rather than text_shout
    # TextShout.where("body like '%##{tag}%'")
    Shout.joins("LEFT JOIN text_shouts ON content_type = 'TextShout' and content_id = text_shouts.id")
      .where('text_shouts.body LIKE ?', "%##{tag}%")
  end
end
