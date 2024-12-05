require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it '全ての項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない場合' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname 名前を入力してください")
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email メールアドレスを入力してください")
      end

      it 'メールアドレスに@が含まれていないと登録できない' do
        @user.email = 'testexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email メールアドレスは不正な値です')
      end

      it '重複したメールアドレスが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email メールアドレスはすでに存在します')
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードを入力してください")
      end

      it 'パスワードが英字のみでは登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password パスワードは英字と数字を含む必要があります')
      end

      it 'パスワードが数字のみでは登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password パスワードは英字と数字を含む必要があります')
      end

      it 'パスワードが5文字以下では登録できない' do
        @user.password = 'a1b2c'
        @user.password_confirmation = 'a1b2c'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password パスワードは6文字以上で入力してください')
      end

      it 'パスワードが全角では登録できない' do
        @user.password = 'ｐａｓｓｗｏｒｄ１'
        @user.password_confirmation = 'ｐａｓｓｗｏｒｄ１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password パスワードは英字と数字を含む必要があります')
      end

      it 'パスワードとパスワード確認が一致していないと登録できない' do
        @user.password = 'password1'
        @user.password_confirmation = 'password2'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation パスワードが一致しません")
      end

      it '性別が未選択では登録できない' do
        @user.gender_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Gender 性別を選択してください')
      end

      it '年齢層が未選択では登録できない' do
        @user.age_group_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('Age group 年齢を選択してください')
      end

      it 'プロフィール画像がない場合は登録できない' do
        @user.profile_image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile image 画像を選択してください")
      end
    end
  end
end
