require 'spec_helper'

module RdInsightly
  describe AuthInsightly do
    after { AuthInsightly.loggout }
    let(:authentication) { AuthInsightly.create '123' }
    context '#create' do
      before { allow(ApiInsightly).to receive(:authentication).and_return(true) }
      context 'should create authorization with api_token' do
        it { expect(authentication).to be_instance_of AuthInsightly }
      end

      context 'when try create authorization without api_token get a exception' do
        let(:authentication_invalid) { AuthInsightly.create }
        it { expect { authentication_invalid }.to raise_error ApiTokenException }
      end
    end
    context '#authenticationorized' do
      context 'when authorization success with insightly' do
        before { allow(ApiInsightly).to receive(:authentication).and_return(true) }
        it { expect(authentication.authorized).to eq true }
      end

      context 'when authorization fail by insightly token wrong' do
        before { allow(ApiInsightly).to receive(:authentication).and_return(false) }
        let(:authentication_fail) { AuthInsightly.create '123' }
        it { expect(authentication_fail.authorized).to eq false }
      end
    end
  end
end
