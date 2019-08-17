class Timeline
  def initialize(user)
    @user = user
  end

  def shouts
    Shout.where(user_id: timeline_user_ids)
  end

  private

  attr_reader :user

  # Identify who's shouts should be in the timeline
  def timeline_user_ids
    user.followed_user_ids + [user.id]
  end
end
