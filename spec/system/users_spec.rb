require 'rails_helper'

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # ログインページに移動する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されていることを確認する
      expect(page).to have_content('ログアウト')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # ログインページに移動する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @login_user = FactoryBot.create(:user)
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do 
    it 'ログイン状態（権限:システム管理者）で正しい情報を入力すればユーザー新規登録ができてユーザー一覧ページに移動する' do
      # ログインする
      sign_in @login_user
      # ユーザー一覧ページへ移動する
      visit admin_users_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規作成')
      # 新規登録ページへ移動する
      visit new_user_admin_registration_path 
      # ユーザー情報を入力する
      fill_in 'user_name', with: @user.name
      fill_in 'user_email', with: @user.email
      find_by_id('user_role').find("option[value='システム管理者']").select_option
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # 詳細ページへ遷移したことを確認する
      expect(current_path).to eq(admin_user_path(User.last))
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it 'ログイン状態（権限:システム管理者）で誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # ログインする
      sign_in @login_user
      # ユーザー一覧ページへ移動する
      visit admin_users_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規作成')
      # 新規登録ページへ移動する
      visit new_user_admin_registration_path 
      # ユーザー情報を入力する
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end
