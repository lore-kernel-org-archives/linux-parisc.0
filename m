From: "Dany Joly" <dany_joly@hotmail.com>
Subject: [parisc-linux] PPPOE with BL180
Date: Sun, 09 Jan 2005 23:00:33 +0000
Message-ID: <BAY21-F174616CDCA2C6E4FFCB76892960@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hi,

I have a HP B 180L running with Woody. Connecting the machine to an ethernet 
connection works very well. My problem is with

PPOE. I recently switched ISP and I now use ADSL. Since then, I am unable to 
access the Internet from this machine. I write

to this forum rather than to a general linux forum because when searching 
Google with "/dev/ppp: Resource temporarily

unavailable", I only get links related to PARISC.

I configured pppoe with pppoeconfig and it seems to go correctly. My problem 
is when I launch the connection. I can see my

connection with ifconfig, but I am unable to access the Internet. When I 
launch plog, I get the following messages:

mammoth:/home/dany# plog
Nov  9 03:16:34 mammoth pppd[392]: Using interface ppp0
Nov  9 03:16:34 mammoth pppd[392]: Connect: ppp0 <--> /dev/pts/0
Nov  9 03:16:34 mammoth pppd[392]: read: Resource temporarily unavailable
Nov  9 03:16:34 mammoth pppd[392]: read /dev/ppp: Resource temporarily 
unavailable
Nov  9 03:16:35 mammoth pppd[392]: read: Resource temporarily unavailable
Nov  9 03:16:35 mammoth pppd[392]: read /dev/ppp: Resource temporarily 
unavailable
Nov  9 03:16:35 mammoth pppd[392]: read: Resource temporarily unavailable
Nov  9 03:16:35 mammoth pppd[392]: read /dev/ppp: Resource temporarily 
unavailable
Nov  9 03:16:38 mammoth pppd[392]: Cannot determine ethernet address for 
proxy ARP
Nov  9 03:16:38 mammoth pppd[392]: local  IP address 67.70.77.230
Nov  9 03:16:38 mammoth pppd[392]: remote IP address 64.230.254.187
Nov  9 03:16:38 mammoth pppd[392]: primary   DNS address 206.47.244.89
Nov  9 03:16:38 mammoth pppd[392]: secondary DNS address 206.47.244.133
Nov  9 03:16:41 mammoth pppd[392]: read: Resource temporarily unavailable
Nov  9 03:16:41 mammoth pppd[392]: read /dev/ppp: Resource temporarily 
unavailable
Nov  9 03:16:44 mammoth pppd[392]: read: Resource temporarily unavailable
Nov  9 03:16:44 mammoth pppd[392]: read /dev/ppp: Resource temporarily 
unavailable


My network configuration is the following:

mammoth:/home/dany# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:60:B0:D0:45:CD
          inet addr:192.168.0.1  Bcast:192.168.0.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:7657 errors:1 dropped:0 overruns:0 frame:0
          TX packets:492 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:2038844 (1.9 MiB)  TX bytes:68461 (66.8 KiB)
          Interrupt:96 Base address:0xff00

eth1      Link encap:Ethernet  HWaddr 00:20:18:55:97:37
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:712 errors:0 dropped:0 overruns:0 frame:0
          TX packets:713 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:51334 (50.1 KiB)  TX bytes:45262 (44.2 KiB)
          Interrupt:97 Base address:0xfd00

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)

ppp0      Link encap:Point-to-Point Protocol
          inet addr:67.70.77.230  P-t-P:64.230.254.187  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
          RX packets:33 errors:0 dropped:0 overruns:0 frame:0
          TX packets:35 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:1635 (1.5 KiB)  TX bytes:1353 (1.3 KiB)

My gateways are the following:

mammoth:/tmp# route -n -F
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
64.230.254.187  0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
192.168.0.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
0.0.0.0         64.230.254.187  0.0.0.0         UG    0      0        0 ppp0

Does anybody have any idea what can prevent pppd from accessing the /dev/ppp 
resource?

Here is my list of process:

dany@mammoth:~$ ps aux
USER       PID %CPU %MEM   VSZ  RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0  1548  584 ?        S    02:28   0:01 init
root         2  0.0  0.0     0    0 ?        SW   02:28   0:00 [keventd]
root         3  0.0  0.0     0    0 ?        SWN  02:28   0:00 
[ksoftirqd_CPU0]
root         4  0.0  0.0     0    0 ?        SW   02:28   0:00 [kswapd]
root         5  0.0  0.0     0    0 ?        SW   02:28   0:00 [bdflush]
root         6  0.0  0.0     0    0 ?        SW   02:28   0:00 [kupdated]
root         9  0.0  0.0     0    0 ?        SW   02:28   0:00 [scsi_eh_1]
root        10  0.0  0.0     0    0 ?        SW<  02:28   0:00 [mdrecoveryd]
root        11  0.0  0.0     0    0 ?        SW   02:28   0:00 [kjournald]
root        75  0.0  0.0     0    0 ?        SW   02:28   0:00 [kjournald]
root        76  0.0  0.0     0    0 ?        SW   02:28   0:00 [kjournald]
root       159  0.0  0.0  1692  732 ?        S    02:29   0:00 /sbin/syslogd
root       162  0.0  0.2  2636 1680 ?        S    02:29   0:01 /sbin/klogd
root       176  0.0  0.1  1868  840 ?        S    02:29   0:00 
/usr/sbin/dhcpd-2.2.x -q eth0
root       284  0.0  0.1  3600 1404 ?        S    02:29   0:00 
/usr/sbin/sshd
daemon     292  0.0  0.0  1812  704 ?        S    02:29   0:00 /usr/sbin/atd
root       295  0.0  0.1  2032  820 ?        S    02:29   0:00 
/usr/sbin/cron
root       301  0.0  0.3 73960 2904 ?        S    02:29   0:00 
/usr/sbin/apache
dany       304  0.0  0.1  2936 1464 tty1     S    02:29   0:00 -bash
root       305  0.0  0.0  1536  576 tty2     S    02:29   0:00 /sbin/getty 
38400 tty2
root       306  0.0  0.0  1536  576 tty3     S    02:29   0:00 /sbin/getty 
38400 tty3
root       307  0.0  0.0  1536  576 tty4     S    02:29   0:00 /sbin/getty 
38400 tty4
root       308  0.0  0.0  1536  576 tty5     S    02:29   0:00 /sbin/getty 
38400 tty5
root       309  0.0  0.0  1536  576 tty6     S    02:29   0:00 /sbin/getty 
38400 tty6
www-data   310  0.0  0.3 73976 2928 ?        S    02:29   0:00 
/usr/sbin/apache
www-data   311  0.0  0.3 73976 2928 ?        S    02:29   0:00 
/usr/sbin/apache
www-data   312  0.0  0.3 73976 2928 ?        S    02:29   0:00 
/usr/sbin/apache
www-data   313  0.0  0.3 73976 2928 ?        S    02:29   0:00 
/usr/sbin/apache
www-data   314  0.0  0.3 73976 2928 ?        S    02:29   0:00 
/usr/sbin/apache
root       329  0.0  0.1  2956 1480 tty1     S    03:12   0:00 bash
root       392  0.0  0.1  2772 1108 ?        S    03:16   0:00 
/usr/sbin/pppd call dsl-provider
root       393  0.0  0.0  1548  560 ?        S    03:16   0:00 
/usr/sbin/pppoe -I eth1 -T 80 -m 1452
root       483  4.2  0.2  7504 2012 ?        S    03:28   0:00 
/usr/sbin/sshd
dany       485  1.5  0.2  7516 2116 ?        S    03:28   0:00 
/usr/sbin/sshd
dany       486  5.5  0.1  2932 1444 pts/1    S    03:28   0:00 -bash
dany       489  0.0  0.2  4568 2124 pts/1    R    03:28   0:00 ps aux

Note that if I start dhclient on eth1, I will get the same error in plog 
(and no Internet), but the following configuration

will be sent to eth1:

eth1      Link encap:Ethernet  HWaddr 00:20:18:55:97:37
          inet addr:192.168.2.10  Bcast:192.168.2.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:909 errors:0 dropped:0 overruns:0 frame:0
          TX packets:896 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:66806 (65.2 KiB)  TX bytes:58418 (57.0 KiB)
          Interrupt:97 Base address:0xfd00


Thank you,

Dany


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
