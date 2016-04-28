class Chapter < ActiveRecord::Base
  belongs_to :book
  has_many :sections, dependent: :destroy
  validates :title, presence: true
end
