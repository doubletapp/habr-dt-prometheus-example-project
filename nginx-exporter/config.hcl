listen {
  # порт, который будет слушать экспортер
  port = 4040
  # эндпоинт для получения метрик
  metrics_endpoint = "/metrics"
}

namespace "nginx" {
  # формат лога Nginx для парсинга
  format = "$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent \"$http_referer\" \"$http_user_agent\" rt=$request_time uct=\"$upstream_connect_time\" uht=\"$upstream_header_time\" urt=\"$upstream_response_time\""
  # границы бакетов для гистограмм
  histogram_buckets = [.005, .01, .025, .05, .1, .25, .5, 1, 2.5, 5, 10]

  # источник логов
  source {
    files = ["/var/log/nginx/app.log"]
  }
}
