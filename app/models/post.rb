class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 150}
  validates :body, presence: true, length: { maximum: 4000}

  has_many :comments, as: :commentable
  belongs_to :user

  def random_test
    title
  end
end
