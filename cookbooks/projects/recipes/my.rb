#
# Set PATH for Postgres.app
#
file_name   = "/etc/paths"
file        = File.read(file_name)
first_line  = File.open(file_name, &:readline)

%w{ bash_profile zshenv }.each do |f|
  cookbook_file "#{ENV['HOME']}/.#{f}" do
    source f
    owner node["rbenv"]["user"]
    group "staff"
    not_if { File.exists?("#{ENV['HOME']}/.#{f}") }
  end
end

cookbook_file "#{ENV['HOME']}/.gitconfig" do
  source "gitconfig"
  owner node["rbenv"]["user"]
  group "staff"
  not_if { File.exists?("#{ENV['HOME']}/.gitconfig") }
end
