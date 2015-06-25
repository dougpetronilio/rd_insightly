require 'spec_helper'

module RdInsightly
  describe ApiInsightly do
    after { Auth.loggout }
    context '#authentication' do
      context 'should return true with api_token correct' do
        before { Auth.create '24c00c9d-59ee-4a9a-9877-8b5f4ca874e9' }
        let(:api) { ApiInsightly.authentication }
        it { expect(api).to eq true }
      end

      context 'should return false if Unauthorized' do
        before { Auth.create '123' }
        let(:api) { ApiInsightly.authentication }
        it { expect(api).to eq false }
      end
    end
  end
end
