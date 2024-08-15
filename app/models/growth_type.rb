class GrowthType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '身長増加' },
    { id: 3, name: '身長減少' },
    { id: 4, name: '体重増加' },
    { id: 5, name: '体重減少' },
    { id: 6, name: '身長・体重増加' },
    { id: 7, name: '身長・体重減少' },
    { id: 8, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :growths
end