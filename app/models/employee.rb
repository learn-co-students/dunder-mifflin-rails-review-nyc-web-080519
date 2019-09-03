class Employee < ApplicationRecord
    belongs_to :dog
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :title, presence: true, uniqueness: true
    validates :office, presence: true
    validates :alias, uniqueness: true

    def full_name
        self.first_name + " " + self.last_name
    end
end
