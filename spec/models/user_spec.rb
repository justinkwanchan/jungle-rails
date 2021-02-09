require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'given a properly registered new user' do
      it 'will successfully save' do
        @user = User.create(
          first_name: 'Spongebob',
          last_name: 'Squarepants',
          email: 'sponge.bob@squarepants.com',
          password: 'crabby#patty',
          password_confirmation: 'crabby#patty',
        )
        expect(@user).to be_valid
      end
    end

    context 'given a new user with no first name' do
      it 'will show error for empty first name' do
        @user = User.create(
          first_name: nil,
          last_name: 'Squarepants',
          email: 'sponge.bob@squarepants.com',
          password: 'crabby#patty',
          password_confirmation: 'crabby#patty',
        )
        expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
      end
    end

    context 'given a new user with no last name' do
      it 'will show error for empty last name' do
        @user = User.create(
          first_name: 'Spongebob',
          last_name: nil,
          email: 'sponge.bob@squarepants.com',
          password: 'crabby#patty',
          password_confirmation: 'crabby#patty',
        )
        expect(@user.errors.full_messages[0]).to eq("Last name can't be blank")
      end
    end

    context 'given a new user with no email' do
      it 'will show error for empty email' do
        @user = User.create(
          first_name: 'Spongebob',
          last_name: 'Squarepants',
          email: nil,
          password: 'crabby#patty',
          password_confirmation: 'crabby#patty',
        )
        expect(@user.errors.full_messages[0]).to eq("Email can't be blank")
      end
    end

    context 'given a new user with no password' do
      it 'will show error for empty password' do
        @user = User.create(
          first_name: 'Spongebob',
          last_name: 'Squarepants',
          email: 'sponge.bob@squarepants.com',
          password: nil,
          password_confirmation: 'crabby#patty',
        )
        expect(@user.errors.full_messages[0]).to eq("Password can't be blank")
      end
    end

    context 'given a new user with no password confirmation' do
      it 'will show error for empty password confirmation' do
        @user = User.create(
          first_name: 'Spongebob',
          last_name: 'Squarepants',
          email: 'sponge.bob@squarepants.com',
          password: 'crabby#patty',
          password_confirmation: nil,
        )
        expect(@user.errors.full_messages[0]).to eq("Password confirmation can't be blank")
      end
    end

    context 'given a new user with where password and password confirmation do not match' do
      it 'will show error for passwords not matching' do
        @user = User.create(
          first_name: 'Spongebob',
          last_name: 'Squarepants',
          email: 'sponge.bob@squarepants.com',
          password: 'crabby#patty',
          password_confirmation: 'chum',
        )
        expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
      end
    end
    
    context 'given a new user, the email must not already exist' do
      it 'will show error for email already taken' do
        @user1 = User.create(
          first_name: 'Spongebob',
          last_name: 'Squarepants',
          email: 'sponge.bob@squarepants.com',
          password: 'crabby#patty',
          password_confirmation: 'crabby#patty',
        )

        @user2 = User.create(
          first_name: 'Patrick',
          last_name: 'Star',
          email: 'Sponge.Bob@Squarepants.com',
          password: 'TwinkleTwinklePatrickStar',
          password_confirmation: 'TwinkleTwinklePatrickStar',
        )
        expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")
      end
    end

    context 'given a new user with a password of fewer than 6 characters' do
      it 'will show error for password too short' do
        @user = User.create(
          first_name: 'Spongebob',
          last_name: 'Squarepants',
          email: 'sponge.bob@squarepants.com',
          password: 'crab',
          password_confirmation: 'crab',
        )
        expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 6 characters)")
      end
    end
  end

  describe '.authenticate_with_credentials' do
    context 'given a proper login' do
      it 'will successfully return the appropriate user information' do
        @user_register = User.create(
          first_name: 'Spongebob',
          last_name: 'Squarepants',
          email: 'sponge.bob@squarepants.com',
          password: 'crabby#patty',
          password_confirmation: 'crabby#patty',
        )

        @user_login = User.authenticate_with_credentials('sponge.bob@squarepants.com', 'crabby#patty')
        expect(@user_login).to eq(@user_register)
      end
    end
    
    context 'given a login with spaces around email' do
      it 'will successfully return the appropriate user information' do
        @user_register = User.create(
          first_name: 'Spongebob',
          last_name: 'Squarepants',
          email: 'sponge.bob@squarepants.com',
          password: 'crabby#patty',
          password_confirmation: 'crabby#patty',
        )

        @user_login = User.authenticate_with_credentials('  sponge.bob@squarepants.com  ', 'crabby#patty')
        expect(@user_login).to eq(@user_register)
      end
    end
    
    context 'given a login with with email having non-matching case' do
      it 'will successfully return the appropriate user information' do
        @user_register = User.create(
          first_name: 'Spongebob',
          last_name: 'Squarepants',
          email: 'Sponge.bob@Squarepants.com',
          password: 'crabby#patty',
          password_confirmation: 'crabby#patty',
        )

        @user_login = User.authenticate_with_credentials('spOnge.bOb@squarepants.com', 'crabby#patty')
        
        expect(@user_login).to eq(@user_register)
      end
    end
  end
end
