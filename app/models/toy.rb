class Toy < ApplicationRecord
    validates :likes, length: {minimum: 0}
end
