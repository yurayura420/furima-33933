require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '正常系' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_name、last＿name、first_name_read、last＿name＿read、birth_dataが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上の英数混合であれば登録できる' do
        @user.password = 'a1234567'
        @user.password_confirmation = 'a1234567'
        expect(@user).to be_valid
      end
      it 'first_nameが全角漢字なら登録できる' do
        @user.first_name = '山本'
        expect(@user).to be_valid
      end
      it 'first_nameが全角カタカナなら登録できる' do
        @user.first_name = 'ヤマモト'
        expect(@user).to be_valid
      end
      it 'first_nameが全角ひらがななら登録できる' do
        @user.first_name = 'やまもと'
        expect(@user).to be_valid
      end
      it 'last_nameが全角漢字なら登録できる' do
        @user.last_name = '剛'
        expect(@user).to be_valid
      end
      it 'last_nameが全角カタカナなら登録できる' do
        @user.last_name = 'ツヨシ'
        expect(@user).to be_valid
      end
      it 'last_nameが全角ひらがななら登録できる' do
        @user.last_name = 'つよし'
        expect(@user).to be_valid
      end
      it 'first_name_readが全角カタカナなら登録できる' do
        @user.first_name_read = 'ヤマモト'
        expect(@user).to be_valid
      end
      it 'last_name_readが全角カタカナなら登録できる' do
        @user.last_name_read = 'ツヨシ'
        expect(@user).to be_valid
      end
    end
    context '異常系' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_name_readが空では登録できない' do
        @user.first_name_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name read is invalid')
      end
      it 'last_name_readが空では登録できない' do
        @user.last_name_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name read is invalid')
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが6文字以下だと登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'first_nameが英数では登録できない' do
        @user.first_name = 'asasas12'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが英数では登録できない' do
        @user.last_name = 'asasas12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_name_readがカタカナ以外では登録できない' do
        @user.first_name_read = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name read is invalid')
      end
      it 'last_name_readがカタカナ以外では登録できない' do
        @user.last_name_read = 'あああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name read is invalid')
      end
    end
  end
end
