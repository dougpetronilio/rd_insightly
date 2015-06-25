require 'spec_helper'

module RdInsightly
  describe AuthInsightly do
    after { AuthInsightly.loggout }
    let(:auth) { AuthInsightly.create '123' }
    context '#create' do
      before { allow(ApiInsightly).to receive(:authentication).and_return(true) }
      context 'should create authorization with api_token' do
        it { expect(auth).to eq '123' }
      end

      context 'when try create authorization without api_token get a exception' do
        let(:authentication_invalid) { AuthInsightly.create }
        it { expect { authentication_invalid }.to raise_error ApiTokenException }
      end
    end

    context '#authorized?' do
      context 'when authorization success with insightly' do
        before do
          allow(ApiInsightly).to receive(:authentication).and_return(true)
          AuthInsightly.create '123'
        end

        it { expect(AuthInsightly.authorized?).to eq true }
      end

      context 'when authorization fail by insightly token wrong' do
        before do
          allow(ApiInsightly).to receive(:authentication).and_return(false)
          AuthInsightly.create '123'
        end
        it { expect(AuthInsightly.authorized?).to eq false }
      end
    end
  end
end
