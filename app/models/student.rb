class Student < ApplicationRecord
  belongs_to :instructor

  validates :age,  comparison: { greater_than: 17}
  validates :name, presence: true
end
