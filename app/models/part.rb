class Part < ApplicationRecord
  validates :name, presence: true

  # collection_select表示用
  def view_material_and_name
    material.name + ' ' + name
  end

  acts_as_list

  has_many :item_parts
  has_many :items, through: :item_parts
  belongs_to :material
end
