class TemplateModel < ApplicationRecord
  # enum
  enum template_type: {面談: 1,商談: 2}

  with_options presence: true do
    validates :template_type
    validates :template_text
  end
end