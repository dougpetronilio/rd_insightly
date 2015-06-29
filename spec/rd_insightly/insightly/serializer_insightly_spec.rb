require 'spec_helper'

module RdInsightly
  describe SerializerInsightly do
    context '#lead' do
      context 'should return object type Lead' do
        let(:result) { SerializerInsightly.lead(LEAD_RESULT) }
        it { expect(result.last_name).to eq 'Petronilio' }
        it { expect(result.name).to eq 'Douglas' }
        it { expect(result.email).to eq 'teste@teste.com' }
        it { expect(result.company).to eq 'TESTE' }
        it { expect(result.job_title).to eq 'ENGINEER' }
        it { expect(result.phone).to eq '12345678' }
        it { expect(result.website).to eq 'www.teste.com' }
        it { expect(result.id).to eq '12345678' }
      end
    end

    context '#lead_to_hash' do
      context 'should return hash Insightly of lead with all fields' do
        let(:lead_hash) { SerializerInsightly.lead_to_hash(Lead.new LAST_NAME, name: NAME, email: EMAIL, company: COMPANY, job_title: JOB_TITLE, phone: PHONE, website: WEBSITE, id: ID) }
        it { expect(lead_hash['LAST_NAME']).to eq LAST_NAME }
        it { expect(lead_hash['FIRST_NAME']).to eq NAME  }
        it { expect(lead_hash['EMAIL_ADDRESS']).to eq EMAIL  }
        it { expect(lead_hash['ORGANIZATION_NAME']).to eq COMPANY  }
        it { expect(lead_hash['TITLE']).to eq JOB_TITLE }
        it { expect(lead_hash['PHONE_NUMBER']).to eq PHONE  }
        it { expect(lead_hash['WEBSITE_URL']).to eq WEBSITE }
        it { expect(lead_hash['LEAD_ID']).to eq ID }
      end
      context 'should return hash Insightly of lead with all fields' do
        let(:lead_hash) { SerializerInsightly.lead_to_hash(Lead.new LAST_NAME) }
        it { expect(lead_hash['LAST_NAME']).to eq LAST_NAME }
      end
    end
  end
end
