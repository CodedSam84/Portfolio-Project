class Skill < ApplicationRecord
  include Placeholder
  validates :title, :percent_utilized, presence: true
end
