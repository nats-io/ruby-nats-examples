require 'nats/client'

# [begin no_echo]
NATS.start("nats://demo.nats.io:4222", no_echo: true) do |nc|
  # ...
end
# [end no_echo]
