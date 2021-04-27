class Part < ApplicationRecord

  validates :name, presence: true

  def view_material_and_name              #collection_select表示用
    self.material.name + ' ' + self.name
  end

  acts_as_list

  has_many :item_parts
  has_many :items, through: :item_parts
  belongs_to :material
  
end