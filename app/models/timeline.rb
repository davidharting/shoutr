class Timeline
  include ActiveModel::Conversion # Implements to_partial_path

  def initialize(users, scope = Shout)
    @users = Array(users) # Handle user or array of users
    @scope = scope
  end

  def shouts
    scope
      .where(user_id: users)
      .order(created_at: :desc)
  end

  private

  attr_reader :users, :scope
end
