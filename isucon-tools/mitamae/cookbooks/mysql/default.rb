# 現在の日時を取得
current_time = Time.now.to_s.gsub(/[- :+]/, '')

# カレントディレクトリを取得
current_dir = File.dirname(__FILE__)
# source_path = File.expand_path("config/mysql.conf.d/mysqld.cnf", current_dir)
source_path = File.expand_path("config/mariadb.conf.d/50-server.cnf", current_dir)

# mysqld.cnfのバックアップ
execute "backup mysqld.conf" do
  command "mv /etc/mysql/mariadb.conf.d/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf.#{current_time}"
  not_if "diff -q /etc/mysql/mariadb.conf.d/50-server.cnf #{source_path}"
end

remote_file "/etc/mysql/mariadb.conf.d/50-server.cnf" do
  owner  "root"
  group  "root"
  source source_path
  mode   "644"
  only_if { File.exist?(source_path) }
  notifies :restart, "service[mysql]"
end

# mysqlの再起動（他のリソースからの通知によってのみ実行される）
service "mysql" do
  action :restart
end
