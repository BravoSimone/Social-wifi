# Ruby implementation of the chillispot hotspotlogin page
# Author: Bravo Simone
# Date: 15/07/15

def login
  # Basic variables definitiona
  # Comment this if you don't use the uamsecret
  $uamsecret = "sharedkey"
  # If all the params are set attempt login:
  if params.to_a.flatten.compact! == nil
    # attempt_login
  end
  # If all params are not set:
  case params['res']
  when 'notyet'
    # display_notye
  when 'failed'
    # display_faied
  when 'success'
    # display_success
  when 'logoff' or 'timeout'
    # display_logoff
  when 'already'
    # display_already
  when 'success_popup'
    # display_success
  end
end

# Login function
def attempt_login
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

def display_notye
end

def display_faied
end
  
def display_success
end

def display_logoff
end
  
def display_already
end
  
def display_success
end
