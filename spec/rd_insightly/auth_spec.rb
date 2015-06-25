require 'spec_helper'

module RdInsightly
  describe Auth do
    context '#create' do
      before { allow(ApiInsightly).to receive(:authentication).and_return(true) }
      let(:auth) { Auth.create '123' }

      context 'should create authorization with api_token' do
        it { expect(auth).to be_kind_of(Auth) }
      end

      context 'when try create authorization without api_token get a exception' do
        let(:authentication_invalid) { Auth.create }
        it { expect { authentication_invalid }.to raise_error ApiTokenException }
      end
    end

    context '#authorized?' do
      context 'when authorization success with insightly' do
        before { allow(ApiInsightly).to receive(:authentication).and_return(true) }
        let(:auth) { Auth.create '123' }

        it { expect(auth.authorized?).to eq true }
      end

      context 'when authorization fail by insightly token wrong' do
        before { allow(ApiInsightly).to receive(:authentication).and_return(false) }
        let(:auth) { Auth.create '123' }
        it { expect(auth.authorized?).to eq false }
      end
    end
  end
end
