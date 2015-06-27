require 'spec_helper'

module RdInsightly
  describe ApiInsightly do
    LEAD_HASH = { LAST_NAME: LAST_NAME }
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

    context '#create_lead' do
      context 'should request ok if token correct' do
        before { RdInsightly.create_authorization TOKEN }
        context 'should call serializer object' do
          let(:lead) { Lead.new LAST_NAME }
          it 'with lead' do
            expect(SerializerInsightly).to receive(:lead_to_hash).with(lead).and_return(LEAD_HASH)
            ApiInsightly.create_lead lead
          end
        end
      end
    end
  end
end
