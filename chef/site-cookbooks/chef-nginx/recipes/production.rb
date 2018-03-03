%w[production].each do |conf|
  template "#{node.nginx.dir}/sites-available/#{conf}.conf" do
    source "production/#{conf}.conf.erb"
    mode '0644'
    notifies :reload, 'service[nginx]', :delayed
  end

  nginx_site "#{conf}.conf"
end
