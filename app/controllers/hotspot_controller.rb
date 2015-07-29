# Ruby implementation of the chillispot hotspotlogin page
# Author: Bravo Simone
# Date: 15/07/15

def index
end

def login
  # Basic variables definitiona
  # Comment this if you don't use the uamsecret
  $uamsecret = "sharedkey"
  # This variable contains the state of the client
  @case = params['res']
end

# Login function
def login
  chal = params['chal']
  password = params['password']
  $uamsecret = "Secreto"
  @hexchal = Array[chal].pack("H32")
  if $uamsecret
    newchal = Array[Digest::MD5.hexdigest(@hexchal + $uamsecret)].pack("H*")
  else
    newchal = @hexchal
  end
  response = Digest::MD5.hexdigest("\0" + password + newchal)
  newpwd = Array[password].pack("a32")
  pappassword = newpwd.xor(newchal).unpack("H32").first
end

def notyet
end

def faied
end
  
def success
end

def logoff
end
  
def already
end
  
def success
end

def facebook
end
