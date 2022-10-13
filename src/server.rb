require 'socket'
socket = TCPServer.new(4040)

loop do
  client = socket.accept
  first_line = client.gets

  if !first_line.nil? && first_line.length > 0
    begin
      if ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'].include?(first_line.split[0])
        verb = first_line.split[0]
        path = first_line.split[1]
        puts verb
        puts path
      end
    rescue =>
      verb.clear
      path.clear
    else
      if verb == 'GET'
        response = "HTTP/1.1 200r\nContent-Type: text/html\\r\n\r\nHello!"
        client.puts(response)
      end
    ensure
      first_line.clear
      client.close
    end
  end
end
socket.close