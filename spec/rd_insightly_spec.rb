require 'spec_helper'

module RdInsightly
  describe RdInsightly do
    it 'has a version number' do
      expect(VERSION).not_to be nil
    end

    context '#create_authorization' do
      it 'should call create Auth' do
        expect(Auth).to receive(:create).with(TOKEN)
        RdInsightly.create_authorization TOKEN
      end
    end

    context 'methods delegators' do
      let(:auth) { RdInsightly.create_authorization TOKEN }
      context '#authorized?' do
        it 'should call authorized? from Auth' do
          expect(auth).to receive(:authorized?)
          RdInsightly.authorized?
        end
      end

      context '#api_token' do
        it 'should call api_token from Auth' do
          expect(auth).to receive(:api_token)
          RdInsightly.api_token
        end
      end
    end
  end
end
