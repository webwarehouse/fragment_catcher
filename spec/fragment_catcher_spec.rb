require "spec_helper"

RSpec.describe FragmentCatcher do
  it "has a version number" do
    expect(FragmentCatcher::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end

RSpec.describe Client do
  let(:client) { Client.new(url: 'http://example.com/', css: 'div') }

  it "get http code" do
    VCR.use_cassette('get_http_code') do
      expect(client.code).to eq("200")
    end
  end
end
