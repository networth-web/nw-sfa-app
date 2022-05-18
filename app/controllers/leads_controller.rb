class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :update_sales_process, :destroy]

  include ImportCsv
  include OutputCsv

  # showアクションのみ閲覧制限
  load_and_authorize_resource :only => [:show]

  # 全て表示
  def all_leads
    Lead.or_search(params) # OR検索対応
    @q = Lead.ransack(params[:q]) # 検索でransackを使用
    @leads = @q.result.not_lost.not_hide.include_association.page(params[:page]).per(50).order(id: "DESC")
    csv_leads = @q.result.not_lost.not_hide.include_association.order(id: "DESC") # CSV出力用のデータ
    @salesprocess_count = SalesProcess.count
    @lead = Lead.new
    @lead_seminar = LeadSeminar.new
    respond_to do |format|
      format.html { render :index }
      format.csv do |csv|
        self.output_csv(csv_leads) # CSV出力
      end
    end
  end

  # 担当者かクローザーのみ表示
  def my_leads
    Lead.or_search(params)
    @q = Lead.ransack(params[:q])
    @leads = @q.result.not_lost.not_hide.only_owner(current_user).or(@q.result.not_lost.not_hide.only_closer(current_user)).page(params[:page]).per(50).order(id: "DESC")
    csv_leads = @q.result.not_lost.not_hide.only_owner(current_user).or(@q.result.not_lost.not_hide.only_closer(current_user)).order(id: "DESC")
    @salesprocess_count = SalesProcess.count
    @lead = Lead.new
    @lead_seminar = LeadSeminar.new
    respond_to do |format|
      format.html { render :index }
      format.csv do |csv|
        self.output_csv(csv_leads)
      end
    end
  end

  def show
    @lead.read_lead(current_user) # 既読処理
    @sales_processes = SalesProcess.all
    @lead_seminar = @lead.lead_seminar
    @activities = @lead.activities.order(id: "DESC")
    @activity = Activity.new
    @schedules = @lead.schedules.order(id: "DESC")
    @duplicate_leads = @lead.duplicates
    @images = @lead.images
    @image = Image.new
    @lost = @lead.lost
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    @lead_seminar = LeadSeminar.new
    if @lead.valid?
      @lead.set_approval(@lead_seminar) # 承認の自動処理
      session["lead.regist_data"] = { lead: @lead.attributes }
    end
  end

  def create_lead_seminar
    @lead = Lead.new(session["lead.regist_data"]["lead"])
    @lead_seminar = @lead.build_lead_seminar(lead_seminar_params)
    respond_to do |format|
      if @lead_seminar.valid?
        @lead.save
        session["lead.regist_data"]["lead"].clear
        flash[:notice] = 'リードを作成しました'
        format.js { render js: "window.location = '#{lead_path(@lead)}'" }
      else
        format.js { render 'leads/js/create_lead_seminar_error.js.erb' }
      end
    end
  end

  def edit
    @form_type = params[:form_type]
  end

  def update
    @form_type = params[:lead][:form_type]
    before_owner = @lead.owner
    before_closer = @lead.closer
    if @lead.update(lead_params)
      flash.now[:notice] = 'リードが更新されました'
      # 通知作成
      @lead.change_user_notify(2, current_user, before_owner, @lead.owner)
      @lead.change_user_notify(3, current_user, before_closer, @lead.closer)
    else
      flash.now[:alert] = 'リードの更新に失敗しました'
    end
  end

  def update_sales_process
    if @lead.update(lead_params)
      redirect_to lead_path(@lead), notice: "プロセスが更新されました"
    else
      redirect_to lead_path(@lead), alert: "プロセスの更新に失敗しました"
    end
  end

  def destroy
    if @lead.destroy
      redirect_to all_leads_leads_path, notice: "リードが削除されました"
    else
      redirect_to lead_path(@lead), alert: "リードの削除に失敗しました"
    end
  end

  def csv
  end

  def csv_import
    before_count = Lead.all.count
    @errors = self.import_csv(params[:file])
    # エラーがない場合通知を作成
    if @errors.empty?
      Lead.csv_import_notify(current_user, before_count, Lead.all.count)
      redirect_to all_leads_leads_path, notice: "CSVがインポートされました"
    else
      flash.now[:alert] = 'CSVのインポートに失敗しました'
      render :csv
    end
  end

  private

  def set_lead
    @lead = Lead.find(params[:id])
  end

  def lead_params
    params.require(:lead).permit(
      :name,
      :kana,
      :phone,
      :email,
      :contact_id,
      :gender_id,
      :birth,
      :age,
      :postal_code,
      :prefecture_id,
      :address,
      :household_id,
      :occupation_id,
      :company,
      :annual_income_range,
      :annual_income,
      :remark,
      :source_id,
      :sales_process_id,
      :owner_id,
      :closer_id
    )
  end

  def lead_seminar_params
    params.require(:lead_seminar).permit(
      :scheduled_date_time,
      :first_preferred_date_time,
      :second_preferred_date_time,
      :third_preferred_date_time,
      :level_id,
      :attend_reason,
      :experience_investment,
      :interest_investment,
      :question,
      :tracking_id,
      :attend_id,
      :approval_id,
      :disapproval_reason,
      :seminar_id
    )
  end

end