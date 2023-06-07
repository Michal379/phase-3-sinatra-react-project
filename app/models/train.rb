class Train < ActiveRecord::Base
    has_many :customers
    has_many :customers, through: :reviews
end