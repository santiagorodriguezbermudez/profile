require 'rails_helper'

RSpec.describe User do
  let(:subject) do
    described_class.new(
      user_name: 'Santiago',
      password: 'secret',
      password_confirmation: 'secret'
    )
  end

  describe 'validations' do
    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should have_many(:projects) }
  end
end
