class Thing < ActiveRecord::Base
  include Protectable
  validates :name, :presence=>true

  has_many :thing_images, inverse_of: :thing, dependent: :destroy
  has_many :images, through: :thing_images

  has_many :thing_tags, inverse_of: :thing, dependent: :destroy
  has_many :tags, through: :thing_tags

  scope :not_linked, ->(image) { where.not(:id=>ThingImage.select(:thing_id)
                                                          .where(:image=>image)) }

  scope :with_images_infos, -> {
   joins(:thing_images)
   .merge(ThingImage.with_name)
   .merge(ThingImage.with_caption)
   .merge(ThingImage.with_position)
   .order('thing_images.priority')
  }

  # scope :with_tags, -> {
  #
  # }

end
