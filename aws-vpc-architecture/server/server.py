import http.server
import socketserver

PORT = 8080

class MyHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(bytes("<html><body><h1>Response from EC2 Instance</h1></body></html>", "utf-8"))

def run(server_class=http.server.HTTPServer, handler_class=MyHandler):
    server_address = ('', PORT)
    httpd = server_class(server_address, handler_class)
    print(f'Starting server on port {PORT}...')
    httpd.serve_forever()

if __name__ == "__main__":
    run()

