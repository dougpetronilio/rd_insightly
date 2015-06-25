require 'spec_helper'

module RdInsightly
  describe ApiInsightly do
    context '#authentication' do
      context 'should return true with api_token correct' do
        let(:api) { ApiInsightly.authentication '24c00c9d-59ee-4a9a-9877-8b5f4ca874e9' }
        it { expect(api).to eq true }
      end

      context 'should return false if Unauthorized' do
        let(:api) { ApiInsightly.authentication '123' }
        it { expect(api).to eq false }
      end
    end
  end
end
