# Домашнее задание 2: Основы контейнеризации

Это простое фронтенд-приложение на Node.js.

Задача — собрать приложение в Docker-образ и запустить его через nginx.

## Что сделано

- добавлен `Dockerfile`;
- добавлен `.dockerignore`;
- использован multi-stage build;
- приложение собирается командой `npm run build`;
- готовая статика из `dist/` раздаётся через `nginx:alpine`.

## Сборка образа

```bash
docker build -t kseniadakiny/frontend:1.0.0 -t kseniadakiny/frontend:latest .
```

## Запуск контейнера

```bash
docker run --rm -p 8080:80 kseniadakiny/frontend:1.0.0
```

После запуска приложение доступно по адресу:

```text
http://localhost:8080
```

## Проверка доступности

```bash
curl -I http://localhost:8080
```

Ожидаемый результат:

```text
HTTP/1.1 200 OK
```

## Проверка размера образа

```bash
docker images kseniadakiny/frontend
```

Файлы проверки находятся в папке `evidence/`.