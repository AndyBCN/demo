# demo
a test project

Files included:

rewrite.conf - demo Nginx module to rewrite addresses to external servers
Requeires SSL cert defintion to work. Will only rewrite HTTPS connections

proxy.conf - demo Nginx module to create forward proxy
Requires ngx_http_proxy_connect_module, Nginx will not work as a full HTTP proxy out of the box so this module is required. Alternative is to use a forward proxy such as Squid. Module includes a custom log format to include details such as time to complete request and ssl protocol

check_proxy.sh - demo script to check functioning of forward proxy
command should be entered with proxy hostname or IP as first arguement and proxy port as second arguement.
This will check the proxy is listening for connections and if working will attempt to connect to www.google.com
