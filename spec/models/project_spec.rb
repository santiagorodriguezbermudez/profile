require 'rails_helper'

RSpec.describe Project do
  let(:subject) do
    described_class.new(
      title: 'Testing Project',
      short_description: 'This is a very short description of the project',
      long_description: '0' * 500,
      company: 'test company',
      role: 'test role',
      year: 2020,
      stacks: %w[html css],
      live_url: 'Link to demo'
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
