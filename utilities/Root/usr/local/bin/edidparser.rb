#!/usr/bin/ruby

  BLACK   = 30
  RED     = 31
  GREEN   = 32
  YELLOW  = 33
  BLUE    = 34
  MAGENTA = 35
  CYAN    = 36
  WHITE   = 37

def color(src,color=RED)
    src =  "\e[#{color}m" + src + "\e[0m"
end

bytes = []
if ARGV.count == 0
    puts color("Reading EDID from SYSTEM")
    begin
    data=`ioreg -l -w0 -d0 -r -c AppleBacklightDisplay`
    edid_hex=data.match(/IODisplayEDID.*?<([a-z0-9]+)>/i)[1]
    vendorid=data.match(/DisplayVendorID.*?([0-9]+)/i)[1].to_i
    productid=data.match(/DisplayProductID.*?([0-9]+)/i)[1].to_i
    puts "found display: vendorid #{vendorid}, productid #{productid}, EDID:\n#{edid_hex}"
    bytes=edid_hex.scan(/../).map{|x|Integer("0x#{x}")}.flatten
  rescue Exception => bang
    puts "Can't Read EDID from SYSTEM. Make sure you have Rename GFX0 to IGPU patches applied."
    puts "Error Details: "
    puts bang
    puts bang.backtrace.join("\n")
    exit
  end
else
    puts color("Reading EDID from FILE")
    file = ARGV.first
    edid_hex = File.read(file)
    bytes=edid_hex.scan(/../).map{|x|Integer("0x#{x}")}.flatten
end  
puts "EDID Length : " + color(("%d bytes" % bytes.length),GREEN)
edid=bytes[8..20]
if edid[0] >> 7 != 0
   puts color("This EDID is corrupted")
else
   first = (edid[0] &  0b01111100) >> 2
   second = ((edid[0] &  0b00000011) << 3) + ((edid[1] &  0b11100000) >> 5)
   third = edid[1] &  0b00011111
  puts "=====Original EDID Data START======"
   puts "Manufacturer: " + color((first+64).chr + (second+64).chr + (third+64).chr)
   puts "Product Code:  " + color(("%02X%02X" % [edid[3], edid[2]]), BLUE)
   puts "Serial Number: " + color(("%d" % (edid[4] + (edid[5] << 8) + (edid[6] << 16) + (edid[7] << 24))), GREEN)
  puts "Week of Manufacture: " + color(("%d" % edid[8]),RED)
   puts "Year of Manufacture: " + color(("%d" % (edid[9] + 1990)),BLUE)
end

checksum = (0x100-(bytes[0..126].reduce(:+) % 256)) % 256
puts "Calculated checksum: " + color(("0x%x" % checksum),GREEN)
puts "Original checksum: "   + color(("0x%x" % bytes[127]),RED)
puts "=====Original EDID Data END======"

puts "=====Creating Fixed EDID====="

puts "Setting Manufacturer to " + color("APP",BLUE)
bytes[8] = 06
bytes[9] = 16

puts "Setting Product Code to " + color("9C7C",RED)
bytes[10] = 0x7C
bytes[11] = 0x9C

puts "Setting Serial to " + color("0",GREEN)
bytes[12] = 0
bytes[13] = 0
bytes[14] = 0
bytes[15] = 0

puts "Setting Week of Manufacture to " + color("10",BLUE)
bytes[16] = 10

puts "Setting Year of Manufacture to " + color("2012",RED)
bytes[17] = 22

checksum = (0x100-(bytes[0..126].reduce(:+) % 256)) % 256
puts "Calculated checksum: " + color(("0x%x" % checksum),GREEN)
puts "Original checksum: " + color(("0x%x" % bytes[127]),BLUE)

bytes[127] = checksum
puts "Fixed EDID for Clover:" + color(("\n#{bytes.map{|b|"%02X"%b}.join}"),GREEN)
puts "Fixed EDID for DSDT: (Insert to Brightness Fix patch)"
byte_number = 0
line_size = 8
puts  color("\"AAPL00,override-no-edid\",")
puts color(( "Buffer "), MAGENTA) +  color(("(0x%2X)" % bytes.length),BLUE) + "\n{"

while byte_number < bytes.length

if (bytes.length - byte_number) >= line_size
    characters = bytes[byte_number..(byte_number+line_size-1)]
else
    characters = bytes[byte_number..bytes.length]
end
    puts color(("#{characters.map{|b|sprintf("0x%02X, ",b) }.join}"),BLUE)
    byte_number +=line_size
end
puts "}\n"