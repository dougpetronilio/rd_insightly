require 'spec_helper'

module RdInsightly
  describe RdInsightly::Lead do
    context '#create' do
      let(:lead) { Lead.create 'lead' }
      context 'should create lead with attributes' do
        before { allow(AuthInsightly).to receive(:authorized).and_return(true) }

        it { expect(lead).to be_instance_of Lead }
        it { expect(lead.name).to eq 'lead' }
      end

      context 'when try create lead without attributes have a error' do
        let(:lead_invalid) { Lead.create }
        it { expect { lead_invalid }.to raise_error LeadException }
      end

      context 'when try create test without authorized get a exception api_token_exception' do
        before { allow(AuthInsightly).to receive(:authorized).and_return(false) }

        it { expect { lead }.to raise_error ApiTokenException }
      end
    end
  end
end
