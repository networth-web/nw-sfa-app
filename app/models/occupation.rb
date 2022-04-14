class Occupation < ActiveHash::Base
  self.data = [
    { id: 1, name: '会社員（上場企業）' },
    { id: 2, name: '会社員（非上場企業）' },
    { id: 3, name: '公務員' },
    { id: 4, name: '教職員' },
    { id: 5, name: '専門職（弁護士・会計士等）' },
    { id: 6, name: '医師・看護師' },
    { id: 7, name: '会社役員（上場企業）' },
    { id: 8, name: '会社役員（非上場企業）' },
    { id: 9, name: '経営者（上場企業）' },
    { id: 10, name: '経営者（非上場企業）' },
    { id: 11, name: '派遣・契約社員' },
    { id: 12, name: 'アルバイト・パート・主婦' },
    { id: 13, name: '自営業・個人事業主' },
    { id: 14, name: 'その他' }
  ]

  # ActiveHash
  include ActiveHash::Associations
  has_many :leads
end