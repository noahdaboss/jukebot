class JoinGroup < SlackRubyBot::Commands::Base
  join_regex = /join (?<room>.*)/i
  match BotRegex.new(join_regex)

  def self.call(client, data, match)
    room = match[:room]
    if JukeBot.api.join(room)
      response = "Alright, we're now part of a group with #{room}"
    else
      response = "Sorry, that doesn't appear to be a room I can join."
    end
    client.say(text: response, channel: data.channel)
  end
end
