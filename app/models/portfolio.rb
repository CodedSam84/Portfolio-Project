class Portfolio < ApplicationRecord
  acts_as_list
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                 reject_if: proc { |attributes| attributes['name'].blank? }
  include Placeholder
  validates :title, :body, :main_image, :thumb_image, presence: true

  def self.angular
    where(subtitle: "Angular")
  end

  def self.by_position
    order("position ASC")
  end

  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: "Ruby on Rails")}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(600,400)
    self.thumb_image ||= Placeholder.image_generator(350,200)
  end
end
