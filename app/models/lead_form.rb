class LeadForm

  include ActiveModel::Model
  include ActiveModel::Attributes # 型キャスト
  include ActiveRecord::AttributeAssignment # datetime_selectの入力値をまとめる

  # Lead
  # attribute :name, :string
  # attribute :kana, :string
  # attribute :email_address, :string
  # attribute :telephone_number, :string
  # attribute :contact_method_id, :integer
  # attribute :gender_id, :integer
  # attribute :birth_date, :date
  # attribute :age, :integer
  # attribute :postal_code, :string
  # attribute :prefecture_id, :integer
  # attribute :address, :string
  # attribute :household_id, :integer
  # attribute :job_id, :integer
  # attribute :workplace, :string
  # attribute :annual_income_band_id, :integer
  # attribute :annual_income, :integer
  # attribute :memo
  # attribute :execution_date, :datetime
  # attribute :sales_process_id, :integer
  # attribute :source_id, :integer
  # attribute :user_id, :integer
  # attribute :closer_id, :integer

  # LeadSeminar
  # attribute :scheduled_date, :datetime
  # attribute :first_preferred_date, :datetime
  # attribute :second_preferred_date, :datetime
  # attribute :third_preferred_date, :datetime
  # attribute :level_id, :integer
  # attribute :participation_reason
  # attribute :investment_experience, :string
  # attribute :investment_interest, :string
  # attribute :question
  # attribute :lead_source_id, :string
  # attribute :participation_id, :integer
  # attribute :achievement_approval_id, :integer
  # attribute :achievement_disapproval_reason
  # attribute :seminar_id, :integer

  # バリデーション

  # フォームアクションの切り替え
  delegate :persisted?, to: :@lead

  # インスタンスの初期化
  def initialize(attributes = nil, lead: Lead.new)
    @lead = lead
    @lead_seminar = @lead.lead_seminar ||= LeadSeminar.new
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return false if invalid?
    ActiveRecord::Base.transaction do
      lead = Lead.create!(lead_params)
      lead.create_lead_seminar!(lead_seminar_params)
    end
      true
    rescue => e
      false
  end

  def update
    return false if invalid?
    ActiveRecord::Base.transaction do
      @lead.update!(lead_params)
      @lead.lead_seminar.update!(lead_seminar_params)
    end
    true
  end

  # アクションのURLの切り替え
  def to_model
    @lead
  end

  private
  def default_attributes
    {
      # Lead
      # name: @lead.name,
      # kana: @lead.kana,
      # email_address: @lead.email_address,
      # telephone_number: @lead.telephone_number,
      # contact_method_id: @lead.contact_method_id,
      # gender_id: @lead.gender_id,
      # birth_date: @lead.birth_date,
      # age: @lead.age,
      # postal_code: @lead.postal_code,
      # prefecture_id: @lead.prefecture_id,
      # address: @lead.address,
      # household_id: @lead.household_id,
      # job_id: @lead.job_id,
      # workplace: @lead.workplace,
      # annual_income_band_id: @lead.annual_income_band_id,
      # annual_income: @lead.annual_income,
      # memo: @lead.memo,
      # execution_date: @lead.execution_date,
      # sales_process_id: @lead.sales_process_id,
      # source_id: @lead.source_id,
      # user_id: @lead.user_id,
      # closer_id: @lead.closer_id,
      # LeadSeminar
      # scheduled_date: @lead_seminar.scheduled_date,
      # first_preferred_date: @lead_seminar.first_preferred_date,
      # second_preferred_date: @lead_seminar.second_preferred_date,
      # third_preferred_date: @lead_seminar.third_preferred_date,
      # level_id: @lead_seminar.level_id,
      # participation_reason: @lead_seminar.participation_reason,
      # investment_experience: @lead_seminar.investment_experience,
      # investment_interest: @lead_seminar.investment_interest,
      # question: @lead_seminar.question,
      # lead_source_id: @lead_seminar.lead_source_id,
      # participation_id: @lead_seminar.participation_id,
      # achievement_approval_id: @lead_seminar.achievement_approval_id,
      # achievement_disapproval_reason: @lead_seminar.achievement_disapproval_reason,
      # seminar_id: @lead_seminar.seminar_id
    }
  end

  def lead_params
    {
      # name: name,
      # kana: kana,
      # email_address: email_address,
      # telephone_number: telephone_number,
      # contact_method_id: contact_method_id,
      # gender_id: gender_id,
      # birth_date: birth_date,
      # age: age,
      # postal_code: postal_code,
      # prefecture_id: prefecture_id,
      # address: address,
      # household_id: household_id,
      # job_id: job_id,
      # workplace: workplace,
      # annual_income_band_id: annual_income_band_id,
      # annual_income: annual_income,
      # memo: memo,
      # execution_date: execution_date,
      # sales_process_id: sales_process_id,
      # source_id: source_id,
      # user_id: user_id,
      # closer_id: closer_id
    }
  end

  def lead_seminar_params
    {
      # scheduled_date: scheduled_date,
      # first_preferred_date: first_preferred_date,
      # second_preferred_date: second_preferred_date,
      # third_preferred_date: third_preferred_date,
      # level_id: level_id,
      # participation_reason: participation_reason,
      # investment_experience: investment_experience,
      # investment_interest: investment_interest,
      # question: question,
      # lead_source_id: lead_source_id,
      # participation_id: participation_id,
      # achievement_approval_id: achievement_approval_id,
      # achievement_disapproval_reason: achievement_disapproval_reason,
      # seminar_id: seminar_id
    }
  end

  def source?
    if source_id.present?
      source_range = Source.first.id..Source.last.id
      unless source_range.include? source_id
        errors.add(:source_id, 'はリストにありません')
        return false
      end
    else
      errors.add(:source_id, 'が選択されていません')
      return false
    end
  end

  def sales_process?
    if sales_process_id.present?
      sales_process_range = SalesProcess.first.id..SalesProcess.last.id
      unless sales_process_range.include? sales_process_id
        errors.add(:sales_process_id, 'はリストにありません')
        return false
      end
    else
      errors.add(:sales_process_id, 'が選択されていません')
      return false
    end
  end

  def owner?
    return if owner_id.blank?
    if User.exists?
      user_range = User.first.id..User.last.id
      unless user_range.include? owner_id
        errors.add(:owner_id, 'はリストにありません')
        return false
      end
    else
      errors.add(:owner_id, 'は対象がありません')
      return false
    end
  end

  def closer?
    return if closer_id.blank?
    if User.exists?
      closer_range = User.first.id..User.last.id
      unless closer_range.include? closer_id
        errors.add(:closer_id, 'はリストにありません')
        return false
      end
    else
      errors.add(:closer_id, 'は対象がありません')
      return false
    end
  end

  def seminar?
    return if seminar_id.blank?
    if Seminar.exists?
      seminar_range = Seminar.first.id..Seminar.last.id
      unless seminar_range.include? seminar_id
        errors.add(:seminar_id, 'はリストにありません')
        return false
      end
    else
      errors.add(:seminar_id, 'は対象がありません')
      return false
    end
  end
end

# lead_form_params = {
#   "name" => "東京太郎",
#   "kana" => "とうきょうたろう",
#   "telephone_number" => "090-1234-5678",
#   "email_address" => "tokyo@gmail.com",
#   "contact_method_id" => 1,
#   "gender_id" => 1,
#   "birth_date" => "1990-01-01",
#   "age" => 30,
#   "postal_code" => 1234567,
#   "prefecture_id" => 1,
#   "address" => "東京都中央区銀座1丁目1-1",
#   "household_id" => 1,
#   "job_id" => 1,
#   "workplace" => "東京Networth",
#   "annual_income_band_id" => 1,
#   "annual_income" => 500,
#   "memo" => "これはメモです。",
#   "execution_date" => "2022-01-01 00:00",
#   "sales_process_id" => 1,
#   "source_id" => 1,
#   "user_id" => 1,
#   "closer_id" => 1,
#   "scheduled_date" => "2022-01-01 00:00",
#   "first_preferred_date" => "2022-01-01 00:00",
#   "second_preferred_date" => "2022-01-01 00:00",
#   "third_preferred_date" => "2022-01-01 00:00",
#   "level_id" => 1,
#   "participation_reason" => "参加理由",
#   "investment_experience" => "投資の経験",
#   "investment_interest" => "興味のある投資",
#   "question" => "質問",
#   "lead_source_id" => "成果承認用ID",
#   "participation_id" => 1,
#   "achievement_approval_id" => 1,
#   "achievement_disapproval_reason" => "",
#   "seminar_id" => ""
# }

# lead_form = LeadForm.new(lead_form_params)

# lead_form.save