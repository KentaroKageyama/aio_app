class BankType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: '普通' }, { id: 3, name: '当座' },
  ]

  include ActiveHash::Associations
  has_many :users
end