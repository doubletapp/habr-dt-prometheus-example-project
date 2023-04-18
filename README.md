# Шаблон HTTP API с Nginx-экспортером

Проект состоит из прокси Nginx, экспортера и HTTP API. В качестве HTTP API используется контейнер [strm/helloworld-http](https://hub.docker.com/r/strm/helloworld-http/), который возвращает `Hello from *hostname*` на запрос на 80-й порт.

### Запуск

1. Создать файл .env
    ```
    $ make env
    ```
    `HOST_MACHINE_PORT` - порт Nginx на хосте для Nginx
2. Запустить приложение
    ```
    $ make
    ```
### Запрос метрик
```
    $ curl 0.0.0.0:${HOST_MACHINE_PORT}
    <html><head><title>HTTP Hello World</title></head><body><h1>Hello from e961bb782356</h1></body></html

    $ curl 0.0.0.0:${HOST_MACHINE_PORT}/metrics
    # HELP nginx_http_response_count_total Amount of processed HTTP requests
    . . .
```
