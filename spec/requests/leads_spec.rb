require 'rails_helper'
RSpec.describe "LeadsController", type: :request do

  before do
    @lead_seminar = FactoryBot.create(:lead_seminar)
    @lead = @lead_seminar.lead
    @user = FactoryBot.create(:user)
  end

  describe "GET #all_leads" do
    it "ログイン状態（権限:システム管理者）でall_leadsアクションにリクエストすると正常にレスポンスが返ってくる" do
      sign_in @user
      get all_leads_leads_path
      expect(response.status).to eq 200
    end
    it 'ログイン状態（権限:システム管理者）でall_leadsアクションにリクエストするとレスポンスに作成済みのリードの名前が存在する' do 
      sign_in @user
      get all_leads_leads_path
      expect(response.body).to include(@lead.name)
    end
  end
  describe 'GET #show' do
    it 'ログイン状態（権限:システム管理者）でshowアクションにリクエストすると正常にレスポンスが返ってくる' do 
      sign_in @user
      get lead_path(@lead)
      expect(response.status).to eq 200
    end
    it 'ログイン状態（権限:システム管理者）でshowアクションにリクエストするとレスポンスに作成済みのリードの名前が存在する' do 
      sign_in @user
      get lead_path(@lead)
      expect(response.body).to include(@lead.name)
    end
  end 
end
