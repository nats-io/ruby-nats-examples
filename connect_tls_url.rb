require 'nats/client'

# [begin connect_tls_url]
EM.run do

  # In order to use TLS with the Ruby NATS client, use the :tls option
  # when customizing the connection with an empty block.
  options = {
    :servers => [
      'nats://demo.nats.io:4443',
    ],
    :tls => {}
  }

  NATS.connect(options) do |nc|
    puts :connected
  end
end
# [end connect_tls_url]
