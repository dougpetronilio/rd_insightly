require 'spec_helper'

module RdInsightly
  describe ApiInsightly do
    context '#authentication' do
      context 'should return true with api_token correct' do
        before { RdInsightly.create_authorization TOKEN }
        let(:api) { ApiInsightly.authentication }
        it { expect(api).to eq true }
      end

      context 'should return false if Unauthorized' do
        before { RdInsightly.create_authorization TOKEN_WRONG }
        let(:api) { ApiInsightly.authentication }
        it { expect(api).to eq false }
      end
    end
  end
end
