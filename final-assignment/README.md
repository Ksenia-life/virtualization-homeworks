# Итоговое домашнее задание

Проект показывает запуск сервисов в контейнерах внутри виртуальной машины.

Схема работы:

```text
VM - Docker Compose - nginx - приложение - PostgreSQL
```

## Состав проекта

- `Vagrantfile` — конфигурация виртуальной машины;
- `provision.sh` — установка Docker, Docker Compose и настройка firewall;
- `docker-compose.yml` — описание контейнеров;
- `nginx.conf` — конфигурация reverse proxy;
- `.env` — переменные окружения для PostgreSQL;
- `evidence/` — файлы с результатами проверки.

## Виртуальная машина

Используется Ubuntu 22.04 LTS.

Параметры VM:

- 2 vCPU;
- 2 ГБ RAM;
- диск больше 20 ГБ;
- сеть: NAT + port forwarding;
- SSH: `127.0.0.1:2222`;
- HTTP: `127.0.0.1:8081`.

Порт `8081` на хосте пробрасывается на порт `80` внутри VM.

## Запуск VM

Команды выполняются из папки `final-assignment`.

```bash
vagrant up --provider=virtualbox
```

Подключение к VM:

```bash
vagrant ssh
```

## Запуск сервисов

Команды выполняются внутри VM.

```bash
cd /vagrant
docker compose up -d
```

Проверка контейнеров:

```bash
docker compose ps
```

## Проверка приложения

С хоста:

```bash
curl -I http://127.0.0.1:8081/
```

Ожидаемый результат:

```text
HTTP/1.1 200 OK
```

## Проверка PostgreSQL

Создание тестовых данных:

```bash
docker compose exec -T db psql -U idz_user -d idz_db -c "CREATE TABLE IF NOT EXISTS notes (id serial PRIMARY KEY, text varchar(100)); INSERT INTO notes (text) VALUES ('test data'); SELECT * FROM notes;"
```

Перезапуск контейнеров:

```bash
docker compose down
docker compose up -d
```

Проверка сохранения данных:

```bash
docker compose exec -T db psql -U idz_user -d idz_db -c "SELECT * FROM notes;"
```

## Подтверждение результата

Выводы команд и проверки сохранены в папке `evidence/`.