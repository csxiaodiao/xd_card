# frozen_string_literal: true
set(:branch, :master)
server("106.14.221.210",
  user: "deploy_user",
  roles: %w{app db web})

set(:ssh_options,
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey))
