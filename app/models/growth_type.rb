class GrowthType < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '身長増加' },
    { id: 2, name: '身長減少' },
    { id: 3, name: '体重増加' },
    { id: 4, name: '体重減少' },
    { id: 5, name: '身長・体重増加' },
    { id: 6, name: '身長・体重減少' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :growths
end