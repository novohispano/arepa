require 'spec_helper'

describe "StreamingService" do
  it "fetches the tweets from the Stream API" do
    sut = TwitterFeed
    result = VCR.use_cassette('twitter'){ sut.fetch.first }
    expect(result.type).to eq "TwitterFeed"
    expect(result.author.name).to eq author.name
    expect(result.author.email).to eq author.email
    expect(result.message).to eq message
    expect(result.published_date).to eq published_date
  end
end