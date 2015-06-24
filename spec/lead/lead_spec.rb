require 'spec_helper'

module RdInsightly
  describe RdInsightly::Lead do
    context '#create' do
      context 'should create lead with attributes' do
        let(:lead) { Lead.create 'lead' }
        it { expect(lead).to be_instance_of Lead }
        it { expect(lead.name).to eq 'lead' }
      end
      context 'when try create lead without attributes have a error' do
        let(:lead_invalid) { Lead.create }
        it { expect { lead_invalid }.to raise_error LeadException }
      end
    end
  end
end
