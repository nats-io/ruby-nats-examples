require 'nats/client'

# [begin connect_token_url]
NATS.start("deadbeef@127.0.0.1:4222") do |nc|
  puts "Connected using token!"
end
# [end connect_token_url]
