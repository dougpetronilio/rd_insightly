require 'spec_helper'

module RdInsightly
  describe ApiInsightly do
    context '#authentication' do
      context 'should return true with response_token correct' do
        before { RdInsightly.create_authorization TOKEN }
        let(:response) { ApiInsightly.authentication }
        it { expect(response).to eq true }
      end

      context 'should return false if Unauthorized' do
        before { RdInsightly.create_authorization TOKEN_WRONG }
        let(:response) { ApiInsightly.authentication }
        it { expect(response).to eq false }
      end
    end

    context '#leads' do
      context 'should return list of leads' do
        before { RdInsightly.create_authorization TOKEN }
        let(:response) { ApiInsightly.leads }
        it { expect(response).not_to be_nil }
      end

      context 'should return nil if TOKEN_WRONG' do
        before { RdInsightly.create_authorization TOKEN_WRONG }
        let(:response) { ApiInsightly.leads }
        it { expect(response).to be_nil }
      end
    end
  end
end
