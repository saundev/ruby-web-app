require 'socket'
require 'openssl'
require 'thread'

server  = TCPServer.new 4040
context = OpenSSL::SSL::SSLContext.new
context.verify_mode = OpenSSL::SSL::VERIFY_PEER | OpenSSL::SSL::VERIFY_FAIL_IF_NO_PEER_CERT
# Local Testing using self signed certificates
# context.cert = OpenSSL::X509::Certificate.new(File.open("certificate.pem"))
# context.key  = OpenSSL::PKey::RSA.new(File.open("key.pem"))
secure = OpenSSL::SSL::SSLServer.new(server, context)

puts "Listening securely on port 4040..."

loop do
  connection = server.accept
  Thread.new {
    first_line = connection.gets

    if !first_line.nil? && first_line.length > 0
      begin
        if ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'].include?(first_line.split[0])
          verb = first_line.split[0]
          path = first_line.split[1]
        end
      rescue =>
        verb.clear
        path.clear
      else
        if verb == 'GET'
          response = "HTTP/1.1 200r\nContent-Type: text/htmlr\nContent-Security-Policy: upgrade-insecure-requests;\\r\n\r\nHello!"
          connection.puts(response)
        end
      ensure
        first_line.clear
        connection.close
      end
    end
  }
end
server.close