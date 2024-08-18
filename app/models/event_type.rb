class EventType < ActiveHash::Base
  self.data = [
    { id: 1, name: '誕生日' },
    { id: 2, name: '入学式' },
    { id: 3, name: '卒業式' },
    { id: 4, name: '運動会' },
    { id: 5, name: '旅行' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :events
end
