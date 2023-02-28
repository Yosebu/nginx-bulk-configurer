server {
    listen 80;

    root /var/www/example.com/;
    index index.html;
    server_name example.com;

}
