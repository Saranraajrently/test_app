class Restaurant < ApplicationRecord
    has_one :account    
    has_many: orders, through: :user
    has_one : orderhistory, through: :user
end
