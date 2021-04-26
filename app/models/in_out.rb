class InOut < ActiveHash::Base
  self.data = [
    { id: 1, name: '入庫' },
    { id: 2, name: '出庫' }
  ]
 include ActiveHash::Associations
   has_many :inventories
 end