require 'spec_helper'

module RdInsightly
  describe AuthInsightly do
    after { AuthInsightly.loggout }
    let(:auth) { AuthInsightly.create '24c00c9d-59ee-4a9a-9877-8b5f4ca874e9' }
    context '#create' do
      before { allow(ApiInsightly).to receive(:auth).and_return(true) }
      context 'should create authorization with api_token' do
        it { expect(auth).to be_instance_of AuthInsightly } 
      end

      context 'when try create authorization without api_token get a exception' do
        let(:auth_invalid) { AuthInsightly.create }
        it { expect { auth_invalid }.to raise_error ApiTokenException }
      end
    end
    context '#authorized' do
      context 'when authorizition success with insightly' do
        before { allow(ApiInsightly).to receive(:auth).and_return(true) }
        it { expect(auth.authorized).to eq true }
      end

      context 'when authorization fail by insightly token wrong' do
        before { allow(ApiInsightly).to receive(:auth).and_return(false) }
        let(:auth_fail) { AuthInsightly.create '123' }
        it { expect { auth_fail }.to raise_error ApiTokenException }
      end
    end
  end
end

