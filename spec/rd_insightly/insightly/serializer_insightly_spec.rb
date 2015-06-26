require 'spec_helper'

module RdInsightly
  describe SerializerInsightly do
    LEAD_RESULT = JSON.parse('[{"LAST_NAME": "Petronilio", "FIRST_NAME": "Douglas", "EMAIL_ADDRESS": "teste@teste.com", "ORGANIZATION_NAME": "TESTE", "TITLE": "ENGINEER", "PHONE_NUMBER": "12345678", "WEBSITE_URL": "www.teste.com"}]').first
    context '#lead' do
      before { RdInsightly.create_authorization TOKEN }
      let(:result) { SerializerInsightly.lead(LEAD_RESULT) }
      it { expect(result.last_name).to eq 'Petronilio' }
      it { expect(result.name).to eq 'Douglas' }
      it { expect(result.email).to eq 'teste@teste.com' }
      it { expect(result.company).to eq 'TESTE' }
      it { expect(result.job_title).to eq 'ENGINEER' }
      it { expect(result.phone).to eq '12345678' }
      it { expect(result.website).to eq 'www.teste.com' }
    end
  end
end
