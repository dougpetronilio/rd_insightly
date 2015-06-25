require 'spec_helper'

module RdInsightly
  describe Lead do
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
        before { allow(AuthInsightly).to receive(:authorized).and_return(nil) }

        it { expect { lead }.to raise_error ApiTokenException }
      end
    end

    context '#all' do
      context 'should list all leads' do
        before { allow(AuthInsightly).to receive(:authorized).and_return(true) }
        let(:leads) { Lead.all }
        it { expect(leads.count).to eq 0 }
      end
    end
  end
end
