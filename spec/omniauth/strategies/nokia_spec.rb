require 'spec_helper'

describe "OmniAuth::Strategies::Nokia" do
  subject do
    OmniAuth::Strategies::Nokia.new(nil, @options || {})
  end

  context 'client options' do
    it 'has correct OAuth endpoint' do
      expect(subject.options.client_options.site).to eq('https://developer.health.nokia.com')
    end

    it 'has correct signature method' do
      expect(subject.options.client_options.signature_method).to eq('HMAC-SHA1')
    end

    it 'has correct request_token_path' do
      expect(subject.options.client_options.request_token_path).to eq('/account/request_token')
    end

    it 'has correct authorize_path' do
      expect(subject.options.client_options.authorize_path).to eq('/account/authorize')
    end

    it 'has correct access_token_path' do
      expect(subject.options.client_options.access_token_path).to eq('/account/access_token')
    end
  end
end
