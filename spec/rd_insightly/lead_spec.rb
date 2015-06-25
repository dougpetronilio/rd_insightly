require 'spec_helper'

module RdInsightly
  describe Lead do
    NAME = 'Lead'
    context '#create' do
      let(:lead) { Lead.create NAME }
      context 'should create lead with attributes' do
        before { allow(RdInsightly).to receive(:authorized?).and_return(true) }

        it { expect(lead).to be_instance_of Lead }
        it { expect(lead.name).to eq NAME }
      end

      context 'when try create lead without attributes have a error' do
        let(:lead_invalid) { Lead.create }
        it { expect { lead_invalid }.to raise_error LeadException }
      end

      context 'when try create test without authorized get a exception api_token_exception' do
        before { allow(RdInsightly).to receive(:authorized?).and_return(nil) }

        it { expect { lead }.to raise_error ApiTokenException }
      end

      context 'should call Api' do
        it 'Insightly method insightly' do
          expect(RdInsightly).to receive(:authorized?).and_return(true)
          Lead.create NAME 
        end
      end
    end

    context '#all' do
      context 'should list all leads' do
        before do
          allow(RdInsightly).to receive(:authorized?).and_return(true)
          allow(ApiInsightly).to receive(:leads).and_return([1])
        end

        let(:leads) { Lead.all }
        it { expect(leads.count).to be > 0 }
      end
     
      context 'should call Api' do
        before { RdInsightly.create_authorization TOKEN }
        it 'to authorize' do
          expect(RdInsightly).to receive(:authorized?).and_return(true)
          Lead.all
        end

        it 'to list leads' do
          expect(ApiInsightly).to receive(:leads)
          Lead.all
        end
      end
    end
  end
end
