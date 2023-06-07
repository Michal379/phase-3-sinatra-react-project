class Review < ActiveRecord::Base
    belongs_to :bus
    belongs_to :train
end