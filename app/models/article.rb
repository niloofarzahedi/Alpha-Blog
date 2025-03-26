class Article < ApplicationRecord
    validates :title, presence: true, length: {minimum:5}
    validates :description, presence: true
end
#it has builtin setter and getter