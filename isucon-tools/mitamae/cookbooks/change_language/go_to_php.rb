# go サービスを停止
execute "Stop go service" do
  command "systemctl stop isucondition.go"
  only_if "systemctl is-active isucondition.go"
end

# go サービスの自動起動を無効化
execute "Disable go service" do
  command "systemctl disable isucondition.go"
  only_if "systemctl is-enabled isucondition.go"
end

# isucon.confのシンボリックリンクを削除
file "/etc/nginx/sites-enabled/isucondition.conf" do
  action :delete
end

# isucon-php.confのシンボリックリンクを作成
link "/etc/nginx/sites-enabled/isucondition-php.conf" do
  to ("/etc/nginx/sites-available/isucondition-php.conf")
  action :create
end

# nginxの再起動
service "nginx" do
  action :restart
end

# php サービスを開始
execute "Start php8.1-fpm service" do
  command "systemctl start isucondition.php"
  not_if "systemctl is-active isucondition.php"
end

# php サービスの自動起動を有効化
execute "Enable php8.1-fpm service" do
  command "systemctl enable isucondition.php"
  not_if "systemctl is-enabled iuscondition.php"
end
