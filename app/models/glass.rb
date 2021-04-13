class Glass < ApplicationRecord

  def view_name_and_opal_color
    self.name + ' ' + self.opal_color.color
  end

  acts_as_list

  has_many :item_glasses
  has_many :items, through: :item_glasses
  belongs_to :opal_color

  validates :name, presence: true

end
