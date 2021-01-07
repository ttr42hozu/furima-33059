require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "ニックネームが必須であること" do 
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  
  it " メールアドレスが必須であること" do 
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  
  it "メールアドレスが一意性であること" do 
    @user.save
    @another_user = FactoryBot.build(:user, email: @user.email)
    @another_user.valid?
    expect(@another_user.errors.full_messages).to include("Email has already been taken")
  end
  
  it "メールアドレスは、@を含む必要があること" do 
    @user.email = "examplegmail.com"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end
  
  it "パスワードが必須であること" do 
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  
  it "パスワードは、6文字以上での入力が必須であること" do 
    @user.password = "aaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end
  
  it "パスワードは、半角英数字混合での入力が必須であること" do 
    @user.password = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  
  it "パスワードは、確認用を含めて2回入力すること" do 
    @user.password_confirmation = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
  end
  
  it "パスワードとパスワード（確認用）、値の一致が必須であること" do 
    @user.password = "a1aaaa"
    @user.password_confirmation = "a2aaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  
  it "ユーザー本名は、名字と名前がそれぞれ必須であること" do 
    @user.first_name = nil
    @user.last_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank")
  end
  
  it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であるこ" do 
    @user.first_name = "testname"
    @user.last_name = "testname"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
  end
  
  it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do 
    @user.first_name_kana = nil
    @user.last_name_kana = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank", "Last name kana can't be blank")
  end
  
  it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do 
    @user.first_name_kana = "testname"
    @user.last_name_kana = "testname"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
  end
  
  it "生年月日が必須であること" do 
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end

