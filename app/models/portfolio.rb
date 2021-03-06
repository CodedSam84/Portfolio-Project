class Portfolio < ApplicationRecord
  acts_as_list
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                 reject_if: proc { |attributes| attributes['name'].blank? },
                                 allow_destroy: true
  validates :title, :body, presence: true

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
    where(subtitle: "Angular")
  end

  def self.by_position
    order("position ASC")
  end

  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: "Ruby on Rails")}
end
