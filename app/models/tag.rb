class Tag < ActiveRecord::Base
  include Protectable

  validates :name, :presence => true

  has_many :thing_tags, inverse_of: :tag, dependent: :destroy
  has_many :things, through: :thing_tags
  has_many :thing_images, through: :things

end
