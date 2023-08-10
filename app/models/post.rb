class Post < ApplicationRecord
  def set_published_status(status)
    update(published: status)
  rescue ActiveRecord::RecordInvalid => e
  end
end
