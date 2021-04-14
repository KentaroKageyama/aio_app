class Glass < ApplicationRecord

  def view_name_and_opal_color
    if self.opal_color_id.present?
      self.name + ' ' + self.opal_color.color
    else
      self.name
    end
  end

  acts_as_list

  has_many :item_glasses
  has_many :items, through: :item_glasses
  belongs_to :opal_color, optional: true

  validates :name, presence: true

end
