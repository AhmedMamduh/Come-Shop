class LineItem < ApplicationRecord::Base
  belongs_to :product
  belongs_to :cart
end
