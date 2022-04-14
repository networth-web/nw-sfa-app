class AnnualIncomeRange < ActiveHash::Base
  self.data = [
    { id: 1, name: "100~149" },
    { id: 2, name: "150~199" },
    { id: 3, name: "200~249" },
    { id: 4, name: "250~299" },
    { id: 5, name: "300~349" },
    { id: 6, name: "350~399" },
    { id: 7, name: "400~449" },
    { id: 8, name: "450~499" },
    { id: 9, name: "500~549" },
    { id: 10, name: "550~599" },
    { id: 11, name: "600~649" },
    { id: 12, name: "650~699" },
    { id: 13, name: "700~749" },
    { id: 14, name: "750~799" },
    { id: 15, name: "800~849" },
    { id: 16, name: "850~899" },
    { id: 17, name: "900~949" },
    { id: 18, name: "950~999" },
    { id: 19, name: "1,000~1,099" },
    { id: 20, name: "1,100~1,199" },
    { id: 21, name: "1,200~1,299" },
    { id: 22, name: "1,300~1,399" },
    { id: 23, name: "1,400~1,499" },
    { id: 24, name: "1,500~1,599" },
    { id: 25, name: "1,600~1,699" },
    { id: 26, name: "1,700~1,799" },
    { id: 27, name: "1,800~1,899" },
    { id: 28, name: "1,900~1,999" },
    { id: 29, name: "2,000~2,499" },
    { id: 30, name: "2,500~2,999" },
    { id: 31, name: "3,000~3,499" },
    { id: 32, name: "3,500~3,999" },
    { id: 33, name: "4,000~4,499" },
    { id: 34, name: "4,500~4,999" },
    { id: 35, name: "5,000~5,999" },
    { id: 36, name: "6,000~6,999" },
    { id: 37, name: "7,000~7,999" },
    { id: 38, name: "8,000~8,999" },
    { id: 39, name: "9,000~9,999" },
    { id: 40, name: "10,000~" }
  ]

  # ActiveHash
  include ActiveHash::Associations
  has_many :leads
end