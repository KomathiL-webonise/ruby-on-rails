class Post < ApplicationRecord
  def publish
    update(published: true)
  rescue ActiveRecord::RecordInvalid => e
  end

  def unpublish
    update(published: false)
  rescue ActiveRecord::RecordInvalid => e
  end
end
