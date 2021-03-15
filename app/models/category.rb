class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '和食' },
    { id: 3, name: '洋食' },
    { id: 4, name: '中華' },
    { id: 5, name: 'イタリアン' },
    { id: 6, name: '居酒屋' },
    { id: 7, name: 'ラーメン' },
    { id: 8, name: 'パン' },
    { id: 9, name: 'スイーツ' },
    { id: 10, name: '肉' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :shops

end