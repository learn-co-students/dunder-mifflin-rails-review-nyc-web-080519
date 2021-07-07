class Employee < ApplicationRecord
    belongs_to :dog
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :alias, presence: true, uniqueness: true
    validates :title, presence: true, uniqueness: true
    validates :office, presence: true
    validates :dog_id, presence: true
end
