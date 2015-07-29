require 'digest/md5'
require './xor'

chal = "12345678901234567890123456789012"
password = "Simone"
$uamsecret = "Secreto"

#@hexchal = chal.chars.pack('H32').strip
@hexchal = Array[chal].pack("H32")
print "HEXCHAL\n"
print @hexchal + "\n"
if $uamsecret
  newchal = Array[Digest::MD5.hexdigest(@hexchal + $uamsecret)].pack("H*")
else
  newchal = @hexchal
end
print "NEWCHAL\n"
print newchal + "\n"

response = Digest::MD5.hexdigest("\0" + password + newchal)
print "RESPONSE\n"
print response + "\n"
newpwd = Array[password].pack("a32")
print "NEWPWD\n"
print newpwd + "\n"
pappassword = newpwd.xor(newchal).unpack("H32").first + "\n"
print newpwd.xor(newchal).unpack("H32").first + "\n"
