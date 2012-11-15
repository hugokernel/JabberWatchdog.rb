require 'rubygems'
require 'xmpp4r-simple'
 
LOGIN='server_account@im.server'
PASS='server_password'
RECIPIENT='your_personnal_account@im.server'
 
begin
  $im = Jabber::Simple.new(LOGIN, PASS)
  $im.deliver(RECIPIENT, "Hello !")
  loop do
    $im.status(nil, `hostname`.strip + ' : ' + `cat /proc/loadavg`.split.first(3).join(' '))
    sleep 30
  end
rescue => e
  p e; sleep 10
  retry
end

