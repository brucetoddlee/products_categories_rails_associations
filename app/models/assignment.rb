class Assignment < ActiveRecord::Base
  belongs_to :product
  belongs_to :cat
end
