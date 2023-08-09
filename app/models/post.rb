class Post < ApplicationRecord
  def publish
    update(published: true)
  rescue ActiveRecord::RecordInvalid => e
    # Handle the error, maybe log it or display a message
  end

  def unpublish
    update(published: false)
  rescue ActiveRecord::RecordInvalid => e
    # Handle the error, maybe log it or display a message
  end
end
