@path = ""

worker_processes 1
working_directory @path
preload_app true

timeout 300
listen "/tmp/api.sock"

pid "#{@path}tmp/pids/unicorn.pid"
stderr_path "#{@path}log/unicorn.stderr.log"
stdout_path "#{@path}log/unicorn.stdout.log"
