powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  action :run
end

file 'c:\inetpub\wwwroot\Default.htm' do
  content "<h1>Hello, World!</h1>
  <h2> PLATFORM: #{node['platform']}</h2>
  <h2>HOSTNAME: #{node['hostname']}</h2>
  <h2>MEMORY: #{node['memory']['total']}</h2>
  <h2>CPU Mhz: #{node['cpu']['0']['mhz']}</h2>"
  rights :read, 'Everyone'
end

service 'w3svc' do
  action [:enable, :start]
end
