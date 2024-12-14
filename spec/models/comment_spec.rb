require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが成功する場合' do
      it '全ての項目が正しく入力されていれば投稿できる' do
        expect(@comment).to be_valid
      end

      it 'contentが100文字以内であれば投稿できる' do
        @comment.content = 'a' * 100
        expect(@comment).to be_valid
      end
    end

    context 'コメントが失敗する場合' do
      it 'contentが空では投稿できない' do
        @comment.content = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content コメントを入力してください")
      end

      it 'contentが101文字以上では投稿できない' do
        @comment.content = 'a' * 101
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content コメントは100文字以内で入力してください")
      end

      it 'userが紐付いていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User ユーザーが紐付いていません")
      end

      it 'postが紐付いていないと投稿できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Post 投稿が紐付いていません")
      end
    end
  end
end
