class Picture < ApplicationRecord
  has_and_belongs_to_many :custom_pages
end
