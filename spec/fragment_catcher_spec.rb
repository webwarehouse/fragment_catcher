require "spec_helper"

RSpec.describe FragmentCatcher do

  let(:fragment_catcher) { FragmentCatcher.new(url: 'http://example.com/', css: 'h1') }

  it "get fragments method" do
    VCR.use_cassette('get_http_code') do
      expect(fragment_catcher.fragments.first).to eq("Example Domain")
    end
  end
end
