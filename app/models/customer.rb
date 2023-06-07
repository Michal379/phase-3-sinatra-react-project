class Customer < ActiveRecord::Base
    belongs_to :bus
    belongs_to :train
end