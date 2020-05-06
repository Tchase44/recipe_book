class Recipe < ApplicationRecord
  has_many :ingredients, :dependent => :delete_all
  # belongs_to :user

  validates :directions, presence: true
  validates :title, presence: true

  default_scope { order(title: :asc) }
end
