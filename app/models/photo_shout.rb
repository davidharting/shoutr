class PhotoShout < ApplicationRecord
  has_one_attached :image

  # Apparently activate storage validations exist in Rails 6 but
  # I am struggling to find documentation
  # I would like to validate content type and file size
end
