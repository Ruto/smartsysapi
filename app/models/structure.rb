class Structure < ApplicationRecord
  has_ancestry

  validates :name, presence: true
  validates_uniqueness_of :name

  belongs_to :user
  #has_many :forms
  #belongs_to :staff

end
