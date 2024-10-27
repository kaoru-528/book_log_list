# frozen_string_literal: true

# Pumaの設定ファイル
max_threads_count = ENV.fetch('RAILS_MAX_THREADS', 5)
min_threads_count = ENV.fetch('RAILS_MIN_THREADS') { max_threads_count }
threads min_threads_count, max_threads_count
port        ENV.fetch('PORT', 3000)
environment ENV.fetch('RAILS_ENV', 'development')
pidfile ENV.fetch('PIDFILE', 'tmp/pids/server.pid')
workers ENV.fetch('WEB_CONCURRENCY', 4)
preload_app!
plugin :tmp_restart

# 本番環境の場合、socketを使う
bind 'unix:///home/ubuntu/www/book_log_list/tmp/sockets/puma.sock' if ENV.fetch('RAILS_ENV') == 'production'
