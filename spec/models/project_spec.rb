require 'rails_helper'

RSpec.describe Project do
  let(:test_user) { User.create(user_name: 'Example User', password: 'secret', password_confirmation: 'secret') }
  let(:subject) do
    described_class.new(
      title: 'Testing Project',
      short_description: 'This is a very short description of the project',
      long_description: '0' * 500,
      company: 'test company',
      role: 'test role',
      year: 2020,
      stacks: %w[html css],
      live_url: 'Link to demo',
      user_id: test_user.id
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should belong_to(:user) }
  end
end
