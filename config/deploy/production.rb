server '43.206.250.30', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/ebisuisho/.ssh/id_rsa'