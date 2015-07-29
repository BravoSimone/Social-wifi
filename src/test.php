<?php

$chal = '12345678901234567890123456789012';
$password = "Simone";
$uamsecret = "Secreto";

$hexchal = pack ("H32", $chal);
print "HEXCHAL\n";
print $hexchal . "\n";
$newchal = $uamsecret ? pack("H*", md5($hexchal . $uamsecret)) : $hexchal;
print "NEWCHAL\n";
print $newchal . "\n";
$response = md5("\0" . ($password) . $newchal);
print "RESPONSE\n";
print $response . "\n";

$newpwd = pack("a32", ($password));
print "NEWPWD\n";
print $newpwd . "\n";
$pappassword = implode ('', unpack("H32", ($newpwd ^ $newchal)));
print "PAPPASSWORD\n";
print $pappassword . "\n";

print implode ('', unpack("H32", ($newpwd ^ "A_Morte_Gli_Ebrei_12345")));

?> 
