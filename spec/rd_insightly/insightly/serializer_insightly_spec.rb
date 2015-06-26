require 'spec_helper'

module RdInsightly
  describe SerializerInsightly do

    context '#lead' do
      before { RdInsightly.create_authorization TOKEN }
      context 'should return object type Lead' do
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
end
