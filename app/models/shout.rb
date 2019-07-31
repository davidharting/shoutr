class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true

  validates :user, presence: true

  # This is a bit controversial to use a default scope here
  # It can be difficult to "undo"
  # However, we aren't modifying too much here
  # And ActiveRecord now has a "reorder" feature
  default_scope { order(created_at: :desc) }

  delegate :username, to: :user
end
