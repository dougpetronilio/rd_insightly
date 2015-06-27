require 'spec_helper'

module RdInsightly
  describe Lead do
    context '#create' do
      let(:lead) { Lead.create LAST_NAME, name: NAME, email: EMAIL, company: COMPANY, job_title: JOB_TITLE, phone: PHONE, website: WEBSITE }
      context 'should create lead with attributes' do
        before do
          allow(RdInsightly).to receive(:authorized?).and_return(true)
          allow(ApiInsightly).to receive(:create_lead).and_return(lead)
          allow(SerializerInsightly).to receive(:lead_to_hash).and_return({})
        end

        it { expect(lead).to be_instance_of Lead }
        it { expect(lead.last_name).to eq LAST_NAME }
        it { expect(lead.name).to eq NAME }
        it { expect(lead.email).to eq EMAIL }
        it { expect(lead.company).to eq COMPANY }
        it { expect(lead.job_title).to eq JOB_TITLE }
        it { expect(lead.phone).to eq PHONE }
        it { expect(lead.website).to eq WEBSITE }
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
        context 'make authorization' do
          before do
            allow(ApiInsightly).to receive(:create_lead).and_return(lead)
            allow(SerializerInsightly).to receive(:lead_to_hash).and_return({})
          end

          it 'Insightly method authorization' do
            expect(RdInsightly).to receive(:authorized?).and_return(true)
            Lead.create LAST_NAME
          end
        end

        context 'post Lead' do
          before { allow(RdInsightly).to receive(:authorized?).and_return(true) }
          it 'Insightly method post to create_lead' do
            expect(ApiInsightly).to receive(:create_lead).with(an_instance_of(Lead))
            Lead.create LAST_NAME
          end
        end
      end
    end

    context '#all' do
      context 'should return list of object Leads' do
        before do
          allow(RdInsightly).to receive(:authorized?).and_return(true)
          allow(ApiInsightly).to receive(:leads).and_return(LEAD_LIST)
        end

        let(:leads) { Lead.all }
        it { expect(leads.first).to be_kind_of Lead }
        it { expect(leads.count).to be 1 }
      end

      context 'should call Api' do
        before do
          allow(RdInsightly).to receive(:authorized?).and_return(true)
          allow(ApiInsightly).to receive(:leads).and_return(LEAD_LIST)
        end

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
