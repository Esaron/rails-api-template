class Api::V1::Resource < ApplicationRecord
  validates :name, presence: true
end
