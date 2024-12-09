require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context '投稿が成功する場合' do
      it '全ての項目が正しく入力されていれば投稿できる' do
        expect(@post).to be_valid
      end

      it 'メモが空でも投稿できる' do
        @post.note = nil
        expect(@post).to be_valid
      end
    end

    context '投稿が失敗する場合' do
      it 'タイトルが空では投稿できない' do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Title タイトルを入力してください")
      end

      it '予定日が空では投稿できない' do
        @post.scheduled_date = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Scheduled date 予定日を選択してください")
      end

      it '予定日が過去の日付では投稿できない' do
        @post.scheduled_date = Date.yesterday
        @post.valid?
        expect(@post.errors.full_messages).to include("Scheduled date は今日以降の日付を選択してください")
      end

      it 'バイクジャンルが未選択では投稿できない' do
        @post.bike_genre_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Bike genre バイクジャンルを選択してください")
      end

      it '排気量が未選択では投稿できない' do
        @post.engine_capacity_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Engine capacity 排気量を選択してください")
      end

      it '都道府県が未選択では投稿できない' do
        @post.prefecture_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Prefecture 都道府県を選択してください")
      end

      it 'メモが101文字以上では投稿できない' do
        @post.note = 'a' * 101
        @post.valid?
        expect(@post.errors.full_messages).to include("Note メモは100文字以内で入力してください")
      end

      it 'ユーザーが紐付いていないと投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User ユーザーが紐付いていません")
      end
    end
  end
end
