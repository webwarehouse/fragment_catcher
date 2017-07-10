require "spec_helper"

RSpec.describe FragmentCatcher do
  it "has a version number" do
    expect(FragmentCatcher::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end

  let(:client) { Client.new(url: 'http://example.com/', css: 'h1') }

  it "get fragments method" do
    VCR.use_cassette('get_http_code') do
      expect(client.fragments.first).to eq("Example Domain")
    end
  end
end
