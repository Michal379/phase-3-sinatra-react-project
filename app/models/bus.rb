class Bus < ActiveRecord::Base
    has_many :customers
    has_many :reviews, through: :customers

end