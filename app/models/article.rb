class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum: 10, maximum: 100}
    validates :description , presence: true, length: {minimum: 10, maximum: 1000}
    belongs_to :user
    has_many :article_categories
    has_many :categories, through: :article_categories
end