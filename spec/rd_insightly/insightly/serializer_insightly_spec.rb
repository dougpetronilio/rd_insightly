require 'spec_helper'

module RdInsightly
  describe SerializerInsightly do
    LEAD_RESULT = JSON.parse('[{"FIRST_NAME": "Douglas"}]').first
    context '#lead' do
      before { RdInsightly.create_authorization TOKEN }
      let(:result) { SerializerInsightly.lead(LEAD_RESULT) }
      it { expect(result.name).to eq 'Douglas' }
    end
  end
end
