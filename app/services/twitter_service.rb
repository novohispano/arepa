class TwitterService

  def self.track(term)
    statuses = []

    client.track(term) do |status, client|
      statuses << status
      client.stop if statuses.count >= 50
    end

    statuses
  end

  def self.client
    client ||= TweetStream::Client.new
  end
end