class Glass < ApplicationRecord
  validates :name, presence: true

  # collection_select表示用
  def view_name_and_opal_color
    if opal_color_id.present?
      name + ' ' + opal_color.color
    else
      name
    end
  end

  acts_as_list

  has_many :item_glasses
  has_many :items, through: :item_glasses
  belongs_to :opal_color, optional: true
end
