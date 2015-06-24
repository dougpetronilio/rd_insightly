require 'spec_helper'

describe RdInsightly::Lead do
  context '#create' do
    context 'should create lead with attributes' do
      let(:lead) { RdInsightly::Lead.new('lead') }
      it { expect(lead).to be_instance_of RdInsightly::Lead }
      it { expect(lead.name).to eq 'lead' } 
    end
  end
end
