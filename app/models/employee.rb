class Employee < ApplicationRecord
    belongs_to :dog
    # validates :title, :alias, uniqueness: true
    # validates_uniqueness_of :title
    # validates_uniqueness_of :alias
    validates :first_name, :last_name, :office, presence: true
    validates :title, :alias, uniqueness: true, presence: true
end
