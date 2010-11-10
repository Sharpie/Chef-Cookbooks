case node[:platform]
when 'debian', 'ubuntu'
  execute 'easy_install-2.7 pip' do
    not_if { `which pip`.chomp.size > 0 }
  end
else
  puts <<-EOS.undent
    Cannot guarentee pip will be installed and linked to python 2.7. Cowardly refusing to continue!
    Coming up with a good workaround is an area for improvement.
  EOS
end
