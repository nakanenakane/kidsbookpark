class PreparationDay < ActiveHash::Base
  self.data = [
      {id: 1, preparation_day: '1〜2日で発送'}, {id: 2, preparation_day: '2〜7日で発送'}, {id: 3, preparation_day: '4〜7日で発送'}
  ]
end