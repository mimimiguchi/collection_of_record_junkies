require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが未入力では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが未入力では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスが入力されていません。")
      end

      it '重複したemailが存在する場合、登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスは既に使用されています。")
      end

      it 'emailに@を含まなければ登録できない' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは有効でありません。")
      end

      it 'passwordが未入力では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが入力されていません。", "パスワードは有効でありません。半角英数字を組み合わせて入力してください", "確認用パスワードとパスワードの入力が一致しません")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end

      it 'passwordは5文字以下では登録できない' do
        @user.password = 'aaa00'
        @user.password_confirmation = 'aaa00'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上に設定して下さい。")
      end

      it 'passwordは半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは有効でありません。半角英数字を組み合わせて入力してください")
      end

      it 'passwordは半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは有効でありません。半角英数字を組み合わせて入力してください")
      end

      it 'passwordは全角では登録できない' do
        @user.password = 'A A A０００'
        @user.password_confirmation = 'A A A０００'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは有効でありません。半角英数字を組み合わせて入力してください")
      end

      it 'last_nameが未入力では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください", "名字は有効でありません。全角文字で入力してください")
      end
  
      it 'last_nameは全角（漢字・ひらがな・カタカナ）入力でなければ登録できない' do
        @user.last_name = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は有効でありません。全角文字で入力してください")
      end
  
      it 'first_nameが未入力では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください", "名前は有効でありません。全角文字で入力してください")
      end
  
      it 'first_nameは全角（漢字・ひらがな・カタカナ）入力でなければ登録できない' do
        @user.first_name = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は有効でありません。全角文字で入力してください")
      end
  
      it 'last_name_kanaが未入力では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字のフリガナを入力してください", "名字のフリガナは有効でありません。全角カタカナで入力してください")
      end
  
      it 'last_name_kanaは全角（漢字・ひらがな・カタカナ）入力でなければ登録できない' do
        @user.last_name_kana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字のフリガナは有効でありません。全角カタカナで入力してください")
      end
  
      it 'first_name_kanaが未入力では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前のフリガナを入力してください", "名前のフリガナは有効でありません。全角カタカナで入力してください")
      end
  
      it 'first_name_kanaは全角（漢字・ひらがな・カタカナ）入力でなければ登録できない' do
        @user.first_name_kana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前のフリガナは有効でありません。全角カタカナで入力してください")
      end
  
      it 'birthdayが未選択では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end

    end
  end
end
