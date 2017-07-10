require "spec_helper"

RSpec.describe FragmentCatcher do

  it "does something useful" do
    expect(false).to eq(true)
  end

  let(:fragment_catcher) { FragmentCatcher.new(url: 'http://example.com/', css: 'h1') }

  it "get fragments method" do
    VCR.use_cassette('get_http_code') do
      expect(fragment_catcher.fragments.first).to eq("Example Domain")
    end
  end
end
