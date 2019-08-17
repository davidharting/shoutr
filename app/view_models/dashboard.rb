class Dashboard
  def initialize(user)
    @user = user
  end

  def timeline
    Timeline.new(user.followed_users + [user])
  end

  private

  attr_reader :user
end
