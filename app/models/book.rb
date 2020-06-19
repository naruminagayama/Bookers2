class Book < ApplicationRecord

  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
  	favorites.where(user_id: user_id).exists?
  end

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: {in: 1..200}

end