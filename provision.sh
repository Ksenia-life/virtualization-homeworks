set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update -y
apt-get install -y nginx curl
systemctl enable nginx

cat > /var/www/html/index.html <<'EOF'
<!doctype html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>Домашнее задание по виртуализации</title>
</head>
<body>
  <h1>Домашнее задание 1 по теме "Основы виртуализации"</h1>
  <p><strong>ФИО:</strong> Болучевская К. С.</p>
  <p><strong>Группа:</strong> ПСАПР-24-1</p>
  <p><strong>Дата:</strong> 29.04.2026</p>
</body>
</html>
EOF

systemctl restart nginx

touch /etc/dz1_provisioned
