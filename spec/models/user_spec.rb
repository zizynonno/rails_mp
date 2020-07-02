require 'rails_helper'

RSpec.describe User, type: :model do
  #FactoryBotでユーザー情報を@userに登録
  before do
    @user = create(:user)
  end

  describe 'バリデーション' do
    it 'nameとemailどちらも値が設定されていれば、OK' do
      expect(@user.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'nameが51文字以上だとNG' do
      @user.name = "a" * 51
      expect(@user.valid?).to eq(false)
    end

    it 'emailが255文字以上だとNG' do
      @user.email = "a" * 244 + "@example.com"
      expect(@user.valid?).to eq(false)
    end

    it 'emailの正規表現が正しく機能してるか' do
      valid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
      valid_addresses.each do |invalid_address|
        expect(build(:user, email: invalid_address)).to be_invalid
      end
    end

    it '重複するメールアドレスの拒否' do
      duplicate_user = @user.dup
      @user.save
      expect(duplicate_user).to be_invalid
    end

    it 'メールアドレスが小文字で保存されているか' do
      mixed_case_email = "Foo@ExAMPle.CoM"
      @user.email = mixed_case_email
      expect(mixed_case_email.downcase).to eq("foo@example.com")
    end

    it 'パスワードが空欄じゃない' do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user.valid?).to eq(false)
    end

    it 'パスワードが６文字以下' do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user.valid?).to eq(false)
    end
  end
end