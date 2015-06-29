require 'spec_helper'

module RdInsightly
  describe Lead do
    context '#create' do
      let(:lead) { Lead.create LAST_NAME, name: NAME, email: EMAIL, company: COMPANY, job_title: JOB_TITLE, phone: PHONE, website: WEBSITE, id: ID }
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
        it { expect(lead.id).to eq ID }
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

      context 'should authorized? to all' do
        before { allow(RdInsightly).to receive(:authorized?).and_return(false) }
        let(:leads) { Lead.all }
        it { expect { leads }.to raise_error ApiTokenException }
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

    context '#delete' do
      context 'should call api delete' do
        before { allow(RdInsightly).to receive(:authorized?).and_return(true) }
        it 'with id' do
          lead = Lead.new LAST_NAME, id: ID
          expect(ApiInsightly).to receive(:delete_lead).with(ID)
          lead.delete
        end
      end

      context 'should authorized? to delete' do
        before { allow(RdInsightly).to receive(:authorized?).and_return(false) }
        let(:new_lead) { Lead.new LAST_NAME, id: ID }
        let(:lead_delete) { new_lead.delete }
        it { expect { lead_delete }.to raise_error ApiTokenException }
      end
    end

    context '#find' do
      context 'should call api find' do
        before { allow(RdInsightly).to receive(:authorized?).and_return(true) }
        let(:lead) { Lead.new LAST_NAME, id: ID }
        it 'with id' do
          expect(ApiInsightly).to receive(:find_lead).with(lead.id)
          Lead.find lead.id
        end
      end

      context 'should return a object Lead' do
        before do
          allow(ApiInsightly).to receive(:find_lead).and_return(Lead.new LAST_NAME, id: ID)
        end
        let(:lead) { Lead.new LAST_NAME, id: ID }
        let(:lead_found) { Lead.find ID }

        it 'object from json' do
          expect(lead_found).to be_instance_of Lead
        end
      end

      context 'should authorized? to find' do
        before { allow(RdInsightly).to receive(:authorized?).and_return(false) }
        let(:lead) { Lead.new LAST_NAME, id: ID }
        let(:lead_find) { Lead.find lead.id }
        it { expect { lead_find }.to raise_error ApiTokenException }
      end
    end

    context '#update' do
      context 'should call api update' do
        before do
          allow(RdInsightly).to receive(:authorized?).and_return(true)
          allow(ApiInsightly).to receive(:leads).and_return(LEAD_LIST)
        end

        it 'update lead fields' do
          lead = Lead.all.first
          lead_changed = lead.dup
          lead_changed.name = 'changed'
          update_lead_hash = { name: lead_changed.name }

          expect(ApiInsightly).to receive(:update_lead).with(be_instance_of Lead)
          lead.update update_lead_hash
        end
      end

      context 'should authorized? to update' do
        before { allow(RdInsightly).to receive(:authorized?).and_return(false) }
        let(:lead) { Lead.all.first }
        let(:lead_update) { lead.update {} }
        it { expect { lead_update }.to raise_error ApiTokenException }
      end

      context 'should return a object Lead' do
        before do
          allow(ApiInsightly).to receive(:update_lead).and_return(Lead.new LAST_NAME, id: ID)
        end
        let(:lead) { Lead.new LAST_NAME, id: ID }
        let(:lead_found) { lead.update({}) }

        it 'object from json' do
          expect(lead_found).to be_instance_of Lead
        end
      end
    end
  end
end
