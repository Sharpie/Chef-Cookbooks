# TODO: Add support for cleanly adding normal deb repos.  Right now this tool
# is envisaged for use with repos of the form:
#   ppa:some_repository
#
action :add do
  e = execute "addding ppa:#{new_resource.ppa_name}" do
    command "apt-add-repository ppa:#{new_resource.ppa_name}"
    action :run
  end
  e.run_action(:run)

  e = execute "update package index" do
    command "apt-get update"
    action :run
  end
  e.run_action(:run)

  new_resource.updated_by_last_action(true)
end 

action :remove do
  e = execute "removing ppa:#{new_resource.ppa_name}" do
    command "apt-add-repository -r ppa:#{new_resource.ppa_name}"
    action :run
  end
  e.run_action(:run)

  new_resource.updated_by_last_action(true)
end
