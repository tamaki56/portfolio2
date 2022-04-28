class Tag < ApplicationRecord
  has_many :photo_tags,dependent: :destroy, foreign_key: 'tag_id'
  # タグは複数の投稿を持つ　それは、post_tagsを通じて参照できる
  has_many :photos,through: :photo_tags

  validates :name, uniqueness: true, presence: true
end
