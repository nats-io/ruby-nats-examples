require 'nats/client'

# [begin connect_token]
NATS.start(token: "deadbeef") do |nc|
  puts "Connected using token"
end
# [end connect_token]
