server '3.113.107.75', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/mapros-key.pem'