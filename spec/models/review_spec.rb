require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe 'レビューの保存' do
    context 'レビューが保存できる場合' do 
      it 'すべての項目が正しく入力されていれば保存できる' do
        expect(@review).to be_valid
      end
    end

    context 'レビューが保存できない場合' do
      it 'タイトルが空では保存できない' do
        @review.title = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Title タイトルを入力してください")
      end

      it 'タイトルが100文字を超えると保存できない' do 
        @review.title = 'a' * 101
        @review.valid?
        expect(@review.errors.full_messages).to include("Title タイトルは100字以内で入力してください")
      end

      it '評価が空では保存できない' do
        @review.rating = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Rating 評価を選択してください")
      end

      it 'コメントが100字を超えると保存できない' do
        @review.comment = 'a' * 101
        @review.valid?
        expect(@review.errors.full_messages).to include("Comment コメントは100字以内で入力してください")
      end
    end
  end
end
