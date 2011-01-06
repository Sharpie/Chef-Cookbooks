maintainer        "Charlie Sharpsteen"
maintainer_email  "source@sharpsteen.net"
license           "Apache 2.0"
description       "Manages repositories and associated GPG keys using apt-add-repository"
version           "0.0.1"

%w{ ubuntu debian }.each do |os|
  supports os
end
