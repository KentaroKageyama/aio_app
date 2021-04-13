class Part < ApplicationRecord

  def view_material_and_name
    self.material.name + ' ' + self.name
  end

  acts_as_list

  has_many :item_parts
  has_many :items, through: :item_parts
  belongs_to :material

  with_options presence: true do
    validates :name, :material_id
  end
  
end
