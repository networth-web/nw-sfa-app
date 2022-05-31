require 'rails_helper'

RSpec.describe 'リード登録', type: :system do
  before do
    @user = FactoryBot.create(:user)
    FactoryBot.create(:source)
    FactoryBot.create(:sales_process)
  end
  context 'リード登録ができるとき'do
    it 'ログイン（権限:システム管理者）したユーザーは新規登録できる' do
      # ログインする
      sign_in(@user)
      # リード一覧ページへ移動
      visit all_leads_leads_path
      # 新規登録ページへのボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録をクリックする
      click_link '新規登録'
      # フォームを確認する
      # フォームに情報を入力する
      sleep 1
      fill_in 'lead_name', with: "hoge"
      find_by_id('lead_contact_id').find("option[value='1']").select_option
      value = find_by_id('lead_source_id').all('option')[1].value
      find_by_id('lead_source_id').find("option[value='#{value}']").select_option
      # 送信ボタンをクリック
      find('input[name="commit"]').click
      expect{
        # 送信ボタンをクリック
        find('input[name="commit"]').click
        sleep 1
      }.to change {Lead.count}.by(1)
      # 詳細ページに遷移することを確認する
      expect(current_path).to eq(lead_path(Lead.last))
      # 「リードが登録されました」の文字があることを確認する
      expect(page).to have_content('リードが登録されました')
      # リード一覧ページに遷移する
      visit all_leads_leads_path
      # リード一覧ページには先ほど登録したリードが存在することを確認する（名前）
      expect(page).to have_link(Lead.last.name)
    end
  end
  context 'リード登録ができないとき'do
    it 'ログインしていないとリード一覧ページに遷移できない' do
      # リード一覧ページへ移動
      visit all_leads_leads_path
      # リード一覧ページへ遷移できないことを確認
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'リード編集', type: :system do
  before do
    @lead_seminar1 = FactoryBot.create(:lead_seminar)
    @lead1 = @lead_seminar1.lead
    @lead_seminar2 = FactoryBot.create(:lead_seminar)
    @lead2 = @lead_seminar2.lead
  end
  context 'リード編集ができるとき' do
    it 'ログインしたユーザーは自分が登録したリードの編集ができる' do
      # リード1の担当者でログインする
      sign_in(@lead1.owner)
      # 詳細ページへ移動
      visit lead_path(@lead1)
      # 詳細ページ「編集」へのリンクがあることを確認する
      expect(page).to have_selector("[data-mdb-target='#leadModal']")
      # 編集リンクをクリックする
      find("[data-mdb-target='#leadModal']").click
      # すでに登録済みの内容がフォームに入っていることを確認する
      sleep 1
      expect(
        find('#lead_name').value
      ).to eq(@lead1.name)
      expect(page).to have_select('lead_contact_id', selected: @lead1.contact.name)
      expect(page).to have_select('lead_source_id', selected: @lead1.source.name)
      # 登録内容を編集する
      fill_in 'lead_name', with: "#{@lead1.name}+編集した名前"
      find_by_id('lead_contact_id').find("option[value='2']").select_option
      find_by_id('lead_source_id').find("option[value='#{@lead1.source_id + 1}']").select_option
      # 編集してもLeadモデルのカウントは変わらないことを確認する
      expect{
        find_by_id('leadDetail').find('input[name="commit"]').click
        sleep 1
      }.to change { Lead.count }.by(0)
      # 詳細ページにいることを確認する
      expect(current_path).to eq(lead_path(@lead1))
      # 「リードが更新されました」の文字があることを確認する
      expect(page).to have_content('リードが更新されました')
      # 詳細ページには先ほど変更した内容のリードが存在することを確認する（名前）
      expect(page).to have_content(@lead1.name)
    end
  end
  context 'リード編集ができないとき' do
    it 'ログイン（権限:一般）したユーザーは自分以外が担当者になっているリードの編集画面には遷移できない' do
      # リード1の担当者でログインする
      sign_in(@lead1.owner)
      # 詳細ページへ移動
      visit lead_path(@lead2)
      # 詳細ページに遷移できないことを確認
      expect(current_path).to eq(root_path)
    end
    it 'ログインしていないとツイートの編集画面には遷移できない' do
      # リード一覧ページへ移動
      visit all_leads_leads_path
      # リード一覧ページへ遷移できないことを確認
      expect(current_path).to eq(new_user_session_path)
    end
  end
end