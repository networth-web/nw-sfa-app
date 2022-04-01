require 'rails_helper'

RSpec.describe Lead, type: :model do
  before do
    @lead = FactoryBot.build(:lead)
  end

  describe 'リード新規登録' do
    context '新規登録できるとき' do
      it 'nameとcontact_id、source_id、sales_process_idが存在すれば登録できる' do
        expect(@lead).to be_valid
      end
      it 'オーナーが紐付いていなくても登録できる' do
        @lead.owner = nil
        expect(@lead).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @lead.name = ''
        @lead.valid?
        expect(@lead.errors.full_messages).to include("名前を入力してください")
      end
      it 'contact_idが空では登録できない' do
        @lead.contact_id = ''
        @lead.valid?
        expect(@lead.errors.full_messages).to include("連絡方法を入力してください")
      end
      it 'ソースが紐付いていなければ登録できない' do
        @lead.source = nil
        @lead.valid?
        expect(@lead.errors.full_messages).to include("ソースを入力してください")
      end
      it '営業プロセスが紐付いていなければ登録できない' do
        @lead.sales_process = nil
        @lead.valid?
        expect(@lead.errors.full_messages).to include("営業プロセスを入力してください")
      end
      it 'owner_idの値が存在しないUserのレコードIDだったら登録できない' do
        @lead.owner_id = 100
        @lead.valid?
        expect(@lead.errors.full_messages).to include("担当者は対象がありません")
      end
      it 'contact_idの値がContactに存在しなければ登録できない' do
        @lead.contact_id = 100
        @lead.valid?
        expect(@lead.errors.full_messages).to include("連絡方法は一覧にありません")
      end
    end
  end
end